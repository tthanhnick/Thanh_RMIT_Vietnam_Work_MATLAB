function [cipher_text] = encodexor(plaintext)
%ENCODE Summary of this function goes here
%   Detailed explanation goes here
N=length(plaintext);%length of string
plain_text=plaintext;%substitute the name
cipher_key = randi([10,200],1);%randome the key
cipher_key=de2bi(cipher_key,8,'left-msb');%change from decimal to binary
plain_text=cast(plain_text,'uint8');%chane to unsigned integer 8 bit
plain_text=de2bi(plain_text,8,'left-msb');%change to binary 
cipher_text = xor(cipher_key,plain_text);%XOR operation
cipher_text=bi2de(cipher_text,'left-msb');%change to decimal
end

