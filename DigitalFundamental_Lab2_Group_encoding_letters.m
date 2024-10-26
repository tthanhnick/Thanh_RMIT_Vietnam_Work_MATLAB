plaintext='nick'; %text
[cipher_text] = encodexor(plaintext);%call function
fprintf('%c',plaintext);%character
fprintf('\n');
% Write encoded message to a text file
fid = fopen('encode.txt', 'w'); % Open the file for write access'w'
fwrite(fid, cipher_text); % Write message to open file 
fclose(fid); % important, we must release the  file back  to  the Operating System after we're done
% Read encoded message from a text file
fid = fopen('encode.txt', 'r'); % Open the file for read access 'r'
cipher_text = fread(fid); % Read the data out of the file 
fclose(fid); % important, we must release the  file back  to  the Operating System after we're done
fprintf('%c',cipher_text);
fprintf('\n');
