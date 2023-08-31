function output = convertunit(input1,input2) %%function use 2 input to calculate the result
%CONVERTUNIT Summary of this function goes here
%   Detailed explanation goes here
    if strcmp(input1, 'celcius to fahrenheit')
        output=(input2*9/5)+32; %calculate data
    elseif strcmp(input1, 'fahrenheit to celcius')
    output=(input2-32)*5/9;%calculate data
    elseif strcmp(input1, 'centimeters to inch') %centimeters to inch
         output=input2/2.54;%calculate data
    elseif strcmp(input1, 'inch to centimeters') %inch to centimeters
        output=input2*2.54;%calculate data
    elseif strcmp(input1, 'meters to feet')%meters to feet
       output=input2/0.3048;%calculate data      
    elseif strcmp(input1, 'feet to meters')%feet to meters
        output=input2*0.3048;%calculate data
    elseif strcmp(input1, 'kilometers to miles') %kilometers to miles
        output=input2/1.609344;%calculate data
    elseif strcmp(input1, 'miles to kilometers') %miles to kilometers
        output=input2*1.609344;%calculate data
    elseif strcmp(input1, 'grams to ounces')%grams to ounces
        output=input2/28.3495;%calculate data
    elseif strcmp(input1, 'ounces to grams')
        output=input2*28.3495;%calculate data
    elseif strcmp(input1, 'kilograms to pounds')%kilograms to pounds 
        output=input2/0.4536;%calculate data
     elseif strcmp(input1, 'pounds to kilograms')%pounds to kilograms  
        output=input2*0.4536;%calculate data
    elseif strcmp(input1, 'tonne to ton') %tonne to ton   
        output=input2/1.016;%calculate data
    elseif strcmp(input1, 'ton to tonne')%ton to tonne
        output=input2*1.016;%calculate data
    else
        output=0; %%invalid input
    end
end

