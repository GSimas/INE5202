// Método Escalonamento de Gauss Otimizado para matriz esparsa (em C), composto de duas etapas: 
//1.mapeamento de indices nao nulos: 
// -lista inicial de linhas e colunas de coeficientes não nulos e 
// -mapeamento instantaneo com lista de linhas e colunas com coeficientes não nulos no 
// momento imediatamente anterior à aplicação do passo k do escalonamento
//2. Aplicação do mapeamento instantaneo nas operações de eliminação Gaussiana.

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <sys/time.h>

#define N   20  //Número Total de equações lineares
#define L   10   //Largura maxima da faixa de coeficientes não nulos da matriz
#define Nb  N/2 //Número maximo de vizinhos nodais após escalonamento, pode se estender ate N/2
#define N1  N+1 //Número Total de colunas da matriz expandida de equações lineares

//Declarando variaveis Globais
double x[N];    // Incognitas 
double A[N][N1];// Matriz expandida de Coeficientes
int    i,j,k;

//Indices para as arvores binarias de busca
int NC0[N],ck0[N][Nb];//indices nodais da matriz original: NC0 numero de colunas, ck0 indices de colunas nao nulas de cada linha (usados também p/ metodos iterativos)
int NL[N] ,Ini[N] ,lk[N]    ,NC[N] ,Inj[N] ,ck[N];    //Índices dinâmicos    da linha i=k e da coluna j=k, que vao se alterando ao longo do escalonamento.
int NLo[N],Inio[N],lko[N][N],NCo[N],Injo[N],cko[N][N];//Índices instantaneos da linha i=k e da coluna j=k, armazenados antes de aplicar a eliminação em cada passo k.

//struct da arvore binario, que armazena uma lista encadeada com indices apontando para os elementos à esquerda e à direita.
struct cel {
   int         chave;/* índice conteúdo */
   struct cel *esq; //chave.*esq do nó 'chave' é o endereço de um nó Y (filho esquerdo de 'chave')
   struct cel *dir; //chave.*dir do nó 'chave' é o endereço de um nó Y (filho direito  de 'chave')
};

typedef struct cel no;
      no *linha[N] ,*coluna[N];
      no  novol[N*N], novoc[N*N];

//Monta lista encadeada com os indices lk[ka] de coeficientes não nulos de uma linha
int erd_lk( no *s) {
	no *y, *q[N];
	int t = 0, ka;

	y = s;
	ka = 0;
	while (y != NULL || t > 0) {
		// a pilha é p[0..t-1]; o índice do topo é t-1
		if (y != NULL) {
			q[t++] = y;
			y = y->esq;
		}
		else {
			y = q[--t];
			lk[ka++] = y->chave;
			y = y->dir;
		}
	}
	return ka;
}
//Monta lista encadeada com os indices ck[ka] de coeficientes não nulos de uma coluna
int erd_ck( no *r) {
	no *x, *p[N];
	int t = 0, ka;

	x = r;
	ka = 0;
	while (x != NULL || t > 0) {
		// a pilha é p[0..t-1]; o índice do topo é t-1
		if (x != NULL) {
			p[t++] = x;
			x = x->esq;
		}
		else {
			x = p[--t];

			ck[ka++] = x->chave;
			x = x->dir;
		}
	}
	return ka;
}

// Recebe um inteiro k e uma árvore de busca r.
// Devolve um nó cuja chave é k;
// se tal nó não existe, devolve NULL.
no *busca( no *r, int k) {
    if (r == NULL || r->chave == k)
       return r;
    if (r->chave > k)
       return busca( r->esq, k);
    else
       return busca( r->dir, k);
}


/*******************************************
 A função recebe uma árvore de busca r e uma
 folha nova 'novol' que não pertence à árvore.
 A função insere o nó novol na árvore
 de modo que a árvore continue sendo de busca
 e devolve o endereço da nova árvore.
*******************************************/
no *insere( no *r, no *novol) {
    no *f, *p;

    if (r == NULL)
		return novol;
    f = r;
    while (f != NULL) {
       p = f;
       if (f->chave > novol->chave)
		   f = f->esq;
       else
		   f = f->dir;
    }
    if (p->chave > novol->chave)
		p->esq = novol;
    else
		p->dir = novol;
    return r;
}

/*******************************************
 A função recebe uma árvore de busca r e
 remove o primeiro nó da árvore
 de modo que a árvore continue sendo de busca
 e devolve o endereço da nova árvore.
 Remove o primeiro nó da árvore na ordem e-r-d (mais à esquerda).
*******************************************/
no *remove_primeiro( no *r) {
    no *f, *p;

	if (r->esq == NULL) {
		r = r->dir;
		return r;
	}
    p = r;
    f = r;
    while (f->esq != NULL) {
       p = f;
       f = f->esq;
    }
	p->esq = f->dir;
	return r;
}

// Recebe uma árvore binária não vazia r.
// Remove o último nó da árvore na ordem e-r-d (mais à direita).
no *remove_ultimo( no *r) {
    no *f, *p;

	if (r->dir == NULL) {
		r = r->esq;
		return r;
	}
    p = r;
    f = r;
    while (f->dir != NULL) {
       p = f;
       f = f->dir;
    }
	p->dir = f->esq;
	return r;
}

double residuo(double A[N][N1], double x[N])
{
   int i,j;
   double r,soma,r1;
   r=0.;
   for (i=1;i<N;i++)
   {
     soma=0.;
     for (j=0;j<N;j++)
     {
       soma=soma+A[i][j]*x[j];
     }
     r1=fabs(A[i][N]-soma);
     if (r1>r) r=r1;
   } //fim i
return r;
}



void findex(double A[N][N1]) //mapeamento de índices, de coef. nao nulos, para otimização do metodo de Gauss, USANDO apenas OS INDICES DETERMINADOS PARA CADA PIVÔ k
{
    int ii,jj,m,fim,fimc;
    int ia,lin,col,passa;
/* Cada elemento de "linha" eh o endereco de uma arvore para cada linha da matriz) */
/* Registrando os coef. j nao nulos INICIAIS da linha i=k da matriz A: */
	k = 0; //Passo k do escalonamento de Gauss
	for(i=0; i<N; i++) 
	{
		linha[i] = NULL;
		jj=0;
		for(j=0; j<N; j++) 
		{
			if (fabs(A[i][j])>1.e-15) 
			{ //detecta coeficiente nao nulo e armazena arvore
	    		novol[k].chave = j;
	    		novol[k].esq = NULL;
				novol[k].dir = NULL;
				linha[i] = insere(linha[i], &novol[k]);
				if(i==j)Inj[i]=jj+1;// posição jj das diagonais principais dentro da linha i de coef. nao nulos
				jj++;
	            k++; /* (mais um 'nó' usado da pilha de 'novol' da linha i) */
			}
		}
		NC[i]=jj;
	    fim=k;//ultimo nó utilizado
	}
printf("\n\nNumero de coeficientes Nao-Nulos iniciais: %d (%lf %%) de NxN totais: %d",fim,fim*100./(N*N),N*N);

/* Registrando os coef. i nao nulos INICIAIS da coluna j=k da matriz A: */
	k = 0;
	for(j=0; j<N; j++) 
	{
		coluna[j] = NULL;
		ii=0;
		for(i=0; i<N; i++) 
		{
			if (fabs(A[i][j])>1.e-15) 
			{//detecta coeficiente nao nulo e armazena arvore
    			novoc[k].chave = i;
    			novoc[k].esq = NULL;
				novoc[k].dir = NULL;
				coluna[j] = insere(coluna[j], &novoc[k]);
				if(j==i)Ini[j]=ii+1;// posição ii das diagonais principais de cada coluna j de coef. nao nulos
				ii++;
        	        	k++; /* (mais um no usado da pilha de 'novoc' da coluna j) */
			}
		}
	    	NL[j]=ii;
        	fimc=k;//ultimo nó utilizado
	}
////printf("\n N. de 'nos' Nao-Nulos: %d de NxN: %d, \npercentual de coeficientes não nulos: %lf \n",fimc,N*N,fim*100./(N*N));

//Define o vetor ck0 inicial, de indices das colunas de cada linha k;
for (k=0;k<N;k++)
{
  NC0[k] = erd_ck(linha[k]); 
  for(ia=0;ia<NC0[k];ia++)ck0[k][ia]=ck[ia];//Aramazena as colunas iniciais.
}
////IMPRESSOES:
printf("\n\n -> Colunas nao nulas iniciais na linha i=k:");
for (k=0;k<N;k++)
{
  printf("\n k: %3d, NC0[k]: %3d -> ",k+1,NC0[k]);
  for(ia=0;ia<NC0[k];ia++)printf("%d ", ck0[k][ia]+1);
}
printf("\n\n -> Linhas nao nulos iniciais na coluna j=k:");
for (k=0;k<N;k++)
{
  NL[k]  = erd_lk(coluna[k]);        //Atualiza o vetor lk, de linhas da coluna j=k;
  printf("\n k: %3d, NL[k]: %3d -> ",k+1,NL[k]);
  for(ia=0;ia<NL[k];ia++)printf("%d ", lk[ia]+1);
  
}
////IMPRESSOES:
/////////////////
for (k=0;k<N-1;k++)//Operações de eliminação da coluna "k", usando operações elementares com as linha k
{
       NC[k] = erd_ck(linha[k]);         //Atualiza o vetor ck, de colunas da linha i=k;
       NL[k] = erd_lk(coluna[k]);        //Atualiza o vetor lk, de linhas da coluna j=k;
       //ARMAZENANDO MAPA ÍNDICES PARA USO EM CADA PASSO k, que será usado para ESCALONAR AS LINHAS SEGUINTES.
	for(ia=0;ia<NC[k];ia++){cko[k][ia]=ck[ia];}
        	                Inio[k]   =Ini[k];
        	                NLo[k]    =NL[k];
	for(ia=0;ia<NL[k];ia++){lko[k][ia]=lk[ia];}
         	                Injo[k]   =Inj[k];
         	                NCo[k]    =NC[k];
	int iif=NL[k]-1,iii=Ini[k];
	for (ii=iif;ii>=iii;ii--)
	{
        lin=lk[ii];
    	jj=Inj[k];//Indice de varredura das colunas j na linha 'i=k' (linha do pivô)
		while(jj<NC[k])
		{
            col=ck[jj];    	//printf("\ncol: %4d,",col+1);
            passa=1;//Tem elementos "nulos" que serao alterados na linha 'lin'
	    	if(busca(linha[lin],col)!=NULL) passa=0;//NÃO tem elementos "nulos" para operar/alterar.
			if (passa==1)
			{
		//	A[lin][col]=-A[k][col]*aux;//Operação e alteração necessária de coeficientes "nulos".
		//inserindo 'col' na LINHA 'ii' no final da lista encadeada
            			novol[fim].chave = col;
    				novol[fim].esq = NULL;
				novol[fim].dir = NULL;
				linha[lin] = insere(linha[lin], &novol[fim]);
				if(col<lin)Inj[lin]++;
					fim++;
		//inserindo 'lin' na COLUNA 'jj' no final da lista encadeada
            			novoc[fimc].chave = lin;
    				novoc[fimc].esq = NULL;
				novoc[fimc].dir = NULL;
				coluna[col] = insere(coluna[col], &novoc[fimc]);
   		if (lin<=col)Ini[col]++;
				fimc++;
     		        }//if (passa==1)
			jj=jj+1;
        	}//while(jj<NC(k))
	//Operação do Termo independente
	//A[lin][M]=A[lin][M]-A[k][M]*aux;//A[lin][k]=0.;
	//Remove a PRIMEIRA coluna da linha 'lin' (a esquerda), devido ao escalonamento de Gauss:
	linha[lin] = remove_primeiro(linha[lin]);
	Inj[lin]--;
	//Elimina a ULTIMA linha da coluna 'col' (embaixo), devido ao escalonamento de Gauss -> para remover ultimo, faz ii iniciar do final
	coluna[k] = remove_ultimo(coluna[k]);
	//Ini[col]--;
    }//for (ii=iif;ii>=iii;ii--)
  
}//for k

////IMPRESSOES:
printf("\n\n -> Colunas nao nulas instantaneas na linha i=k:");
for (k=0;k<N-1;k++)
{	printf("\n k: %3d -> ",k+1); 
	for(ia=0;ia<NC[k];ia++)printf("%d ", cko[k][ia]+1);
	printf("    -> %3d elementos.",NCo[k]);   
}//for k
printf("\n\n -> Linhas nao nulas instantaneas na coluna j=k:");
for (k=0;k<N-1;k++)
{	printf("\n k: %3d -> ",k+1); 
	for(ia=0;ia<NL[k];ia++)printf("%d ", lko[k][ia]+1);
	printf("    -> %3d elementos.",NLo[k]);   
}//for k

}//void findex ()



void fGaussEsparsa(double A[N][N1], double x[N]) //Gauss otimizado, USANDO apenas OS INDICES DETERMINADOS PARA CADA PIVÔ k
{  int lin,col,ii,jj,passa;
   int ia;
   double aux,soma,tota,tot=0.;
for (k=0;k<N-1;k++)//Escalonamento na coluna "k"
{   int iif=NLo[k]-1,iii=Inio[k];
	for (ii=iif;ii>=iii;ii--)//linhas ii da coluna k que tem coeficientes 'não nulos', para serem eliminadas
	{
        lin=lko[k][ii]; //lista de linhas ‘lin’ que devem ser manipuladas no passo k
		aux=A[lin][k]/A[k][k];
    	for(jj=Injo[k];jj<NCo[k];jj++)//colunas jj da linha k que tem coeficientes 'não nulos' para ser operados nas eliminações
		{
        	col=cko[k][jj]; //lista de colunas ‘col’ que devem ser manipuladas no passo k
        	A[lin][col]=A[lin][col]-A[k][col]*aux; //Opera-se os coeficientes A[k][col] "não nulos" necessários, aqueles que alteram A[lin][col] na linha 'lin' 
							      //se A[lin][col] for "nulo", poderia ser apenas A[lin][col]= -A[k][col]*aux; otimizando uma operação de adição 
        }//for(jj=Injo[k];jj<NCo[k];jj++)
		A[lin][N]=A[lin][N]-A[k][N]*aux;///Opera o Termo independente
		A[lin][k]=0.;//diagonal principal não é calculada: Valor NULO é atribuido.
    }//for (ii=iif;ii>=iii;ii--)
}//for k
 
////SUBSTITUIÇÕES
     x[N-1]=A[N-1][N]/A[N-1][N-1];//Sistemas possíveis e determinados
     for (i=(N-2);i>=0;i--)
     {
       soma=0.;
       for (jj=1;jj<NCo[i];jj++){
            soma=soma+A[i][cko[i][jj]]*x[cko[i][jj]];}//Opera com os coeficientes nao nulos necessários
            x[i]=(A[i][N]-soma)/A[i][i];//
     } //Fim i
}//fGaussEsparsa


void leitura_matriz(double A[N][N1])
{printf("\n Matriz pentadiagonal de N= %d equacoes e largura maxima de faixa L= %d (em um lado da diagonal principal)\n",N,L);
  i=1-1;                  {                           A[i][i]=1.;A[i][i+1]=1.;             A[i][N1-1]=1.50;}
  for(i=2-1;i<N/2;i++)    {              A[i][i-1]=1.;A[i][i]=4.;A[i][i+1]=1.;A[i][i+L]=1.;A[i][N1-1]=1.00;}
  for(i=N/2+1-1;i<N-1;i++){A[i][i-L]=-1.;A[i][i-1]=1.;A[i][i]=4.;A[i][i+1]=1.;             A[i][N1-1]=2.00;}
//for(i=2-1;i<N/2;i++)    {              A[i][i-1]=1.;A[i][i]=4.;A[i][i+1]=1.;             A[i][N1-1]=1.00;}
//for(i=N/2+1-1;i<N-1;i++){              A[i][i-1]=1.;A[i][i]=4.;A[i][i+1]=1.;             A[i][N1-1]=2.00;}
  i=N-1;                  {              A[i][i-1]=1.;A[i][i]=1.;                          A[i][N1-1]=3.00;}
for(i=1-1;i<N;i++)
{	printf("\n %2d > ",i+1);
	for(j=1-1;j<N1;j++)printf("%1.lf ",A[i][j]);
}
}

int main()
{   
struct timeval inicio, final;
int tmili;

//  definiçao do sistema
leitura_matriz(A); //Define matriz exapadida do sistema esparso

gettimeofday(&inicio, NULL);
    
findex(A);//Define indices iniciais e instantaneos de cada passo k, dos elementos não nulos da matriz esparsa A.
    
gettimeofday(&final, NULL);
tmili = (int) (1000000000 * (final.tv_sec - inicio.tv_sec) + (final.tv_usec - inicio.tv_usec) / 1000);
printf("\nTempo decorrido na INDEXACAO, Inicial e instantanea, dos coeficientes Nao nulos : %d nano s \n", tmili);

double A0[N][N1];
for (i=0;i<(N);i++)for (j=0;j<(N1);j++)A0[i][j]=A[i][j];//PRESERVA A MATRIZ ORIGINAL A0 para aferição de residuos

//Funcão escalonamento de Gauss otimizada com o mapa de indices determinado
{
gettimeofday(&inicio, NULL);
printf("\n\n1). Solucao Direta: Escalonamento de Gauss Otimizado operando matriz Nao nula: \n");
     fGaussEsparsa(A,x);//Escalonamento de Gauss OTIMIZADO, usando mapa de índices obtido em fGaussEsparsa
printf("\nS={x[1]: %.10lf,..., x[%d]: %.10lf}",x[0],N,x[N-1]);
gettimeofday(&final, NULL);
tmili = (int) (1000000000 * (final.tv_sec - inicio.tv_sec) + (final.tv_usec - inicio.tv_usec) / 1000);
printf("\nTempo decorrido Gauss OTIMIZADO : %d nano s \n", tmili);
}
double r=residuo(A0,x); //Aferição dos resultados.
printf("\n Residuo maximo: %0.20lf",r);

}// main
