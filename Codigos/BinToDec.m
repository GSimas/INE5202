%Binary to decimal function
function BinToDec = BinToDec(bin)

m = length(bin);
mat = ones(m);
mat = mat(:,1);
dec = mat';
for n = m:-1:1
    dec(n) = (2^(n-1))*bin(n);
end
dec = sum(dec)
end