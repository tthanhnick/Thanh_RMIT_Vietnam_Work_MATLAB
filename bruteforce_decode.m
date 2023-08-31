function [message] = bruteforce_decode(cipher_text,message)
%BRUTEFORCE_DECODE Summary of this function goes here
%   Detailed explanation goes here
ciphertext = cipher_text;%substutte
ciphertext=cast(ciphertext,'uint8');%change to unsigned 8 bit
ciphertext=de2bi(ciphertext,8,'left-msb');% convert from decimal to binary
N=length(ciphertext);%length of string
for k=1:255 
    cipherkey = randi([1,200],1);%random the key
    cipherkey=de2bi(cipherkey,8,'left-msb');%convert to binary
    for g=1:N
        dmessage=xor(ciphertext,cipherkey);%XOR operation
        dmessage=bi2de(dmessage,'left-msb');%change to decimal
        message=dmessage;%substitue the value
    end 
    fprintf('%c',message);%print message
    fprintf('\n');
end
end

