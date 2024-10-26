% Read encoded message from a text file
fid = fopen('encode.txt', 'r'); % Open the file for read access 'r'
cipher_text = fread(fid); % Read the data out of the file 
fclose(fid); % important, we must release the  file back  to  the Operating System after we're done
[message] = bruteforce_decode(cipher_text);%call function
fprintf('%c',message);%print message
fprintf('\n');
% Write encoded message to a text file
fid = fopen('decode.txt', 'w'); % Open the file for write access'w'
fwrite(fid, message); % Write message to open file 
fclose(fid); % important, we must release the  file back  to  the Operating System after we're done
% Read encoded message from a text file
fid = fopen('decode.txt', 'r'); % Open the file for read access 'r'
message = fread(fid); % Read the data out of the file 
fclose(fid); % important, we must release the  file back  to  the Operating System after we're done
