disp('-----------------------')
disp('Units Converter program')%display
disp('-----------------------')
disp('It is not a case sensitive program');
disp('-----------------------')
x=input('enter which type of unit you want to convert t for temperature, l for length and distance and m for mass: ','s');%input unit to choose
x=lower(x); %exclude case sensitive
while (isempty(x)||~(strcmp(x, 't')||strcmp(x, 'l')||strcmp(x, 'm')))%repeat the request if the input fails
    x=input('invalid value\nenter which type of unit you want to convert t for temperature, l for length and distance and m for mass: ','s');%input unit to choose
end

switch x %use switch to choose what you want to convert  
    case 't' %temperature
y=input('enter which type of unit you want to convert c for celcius to fahrenheit, f for fahrenheit to celcius: ','s'); %input unit
y=lower(y);%case sensitive
while (isempty(y)||~(strcmp(y, 'c')||strcmp(y, 'f')))%repeat the request if the input fails
    y=input('invalid value\nenter which type of unit you want to convert c for celcius to fahrenheit, f for fahrenheit to celcius: ','s'); %input unit
end
switch y %use switch to choose what you want to convert
    case 'c' %celcius to fahrenheit
c=input('enter degree in celcius ');%input data
while isempty(c)
    c=input('invalid value\nenter degree in celcius ');%input data
end
f=(c*9/5)+32; %calculate data
fprintf('the anser is %1.3f fahrenheit\n',f) %print data

    case 'f' %fahrenheit to celcius
f=input('enter degree in fahrenheit ');%input data
while isempty(f)%repeat the request if the input fails
    f=input('invalid value\nenter degree in fahrenheit ');%input data
end
c=(f-32)*5/9;%calculate data
fprintf('the anser is %1.3f celcius\n',c)%print data
end

case 'l'%length
y=input('enter which type of unit you want to convert c for centimeters to inch, i for inch to centimeter,\nm for meters to feet,f for feet to meters,k for kilometers to miles,n for miles to kilometers: ','s'); %input unit
y=lower(y);%exclude case sensitive
while isempty(y)||~(strcmp(y, 'c')||strcmp(y, 'i')||strcmp(y, 'm')||strcmp(y, 'f')||strcmp(y, 'k')||strcmp(y, 'n'))%repeat the request if the input fails
    y=input('invalid value\nenter which type of unit you want to convert c for centimeters to inch, i for inch to centimeter,\nm for meters to feet,f for feet to meters,k for kilometers to miles,n for miles to kilometers: ','s'); %input unit
end
switch y %use switch to choose what you want to convert
     case 'c' %centimeters to inch
         cm=input('enter length in centimeters ');%input data
while isempty(cm)|| cm <1%repeat the request if the input fails
    cm=input('invalid value\nenter length in centimeters ');%input data
end
inch=cm/2.54;%calculate data
fprintf('the anser is %1.3f inch\n',inch)%print data

    case 'i'%inch to centimeters
inch=input('enter length in inch ');%input data
while isempty(inch) || inch <1%repeat the request if the input fails
    inch=input('invalid value\nenter length in inch ');%input data
end
cm=inch*2.54;%calculate data
fprintf('the anser is %1.3f centimeters\n',cm)%print data

    case 'm'%meters to feet
        m=input('enter length in meters ');%input data
while isempty(m)|| m <1%repeat the request if the input fails
    m=input('invalid value\nenter length in meters ');%input data
end
ft=m/0.3048;%calculate data
fprintf('the anser is %1.3f feet\n',ft)%print data

    case 'f'%feet to meters
        ft=input('enter length in feet ');%input data
while isempty(ft) || ft <1%repeat the request if the input fails
    ft=input('invalid value\nenter length in feet ');%input data
end
m=ft*0.3048;%calculate data
fprintf('the anser is %1.3f meters\n',m)%print data

    case 'k'%kilometers to miles
        km=input('enter length in kilometers ');%input data
while isempty(km) || km <1%repeat the request if the input fails
    km=input('invalid value\nenter length in kilometers ');%input data
end
mi=km/1.609344;%calculate data
fprintf('the anser is %1.3f mile\n',mi)%print data

    case 'n'%miles to kilometers
         mi=input('enter length in miles ');%input data
while isempty(mi)|| mi <1%repeat the request if the input fails
    mi=input('invalid value\nenter length in miles ');%input data
end
km=mi*1.609344;%calculate data
fprintf('the anser is %1.3f kilometers\n',km)%print data
end

case 'm'%mass
y=input('enter which type of unit you want to convert g for grams to ounces, o for ounces to grams,\nk for kilograms to pounds,p for pounds to kilograms,t for tonne to ton,n for ton to tonne: ','s'); %input unit
 y=lower(y);%exclude case sensitive
while isempty(y)||~(strcmp(y, 'g')||strcmp(y, 'o')||strcmp(y, 'k')||strcmp(y, 'p')||strcmp(y, 't')||strcmp(y, 'n'))%repeat the request if the input fails
    y=input('invalid value\nenter which type of unit you want to convert g for grams to ounces, o for ounces to grams,\nk for kilograms to pounds,p for pounds to kilograms,t for tonne to ton,n for ton to tonne: ','s'); %input unit
end
switch y %use switch to choose what you want to convert
    case 'g'%grams to ounces
        g=input('enter mass in grams ');%input data
while isempty(g) || g <1%repeat the request if the input fails
g=input('invalid value\nenter mass in grams ');%input data
end
oz=g/28.3495;%calculate data
fprintf('the anser is %1.3f ounces\n',oz)%print data

    case 'o'%ounces to grams
        oz=input('enter mass in ounces ');%input data
while isempty(oz) || oz <1%repeat the request if the input fails
oz=input('invalid value\nenter mass in ounces ');%input data
end
g=oz*28.3495;%calculate data
fprintf('the anser is %1.3f grams\n',g)%print data

    case 'k'%kilograms to pounds
        kg=input('enter mass in kilograms ');%input data
while isempty(kg) || kg <1%repeat the request if the input fails
kg=input('invalid value\nenter mass in kilograms ');%input data
end
ib=kg/0.4536;%calculate data
fprintf('the anser is %1.3f pounds\n',ib)%print data

    case 'p'%pounds to kilograms
        ib=input('enter mass in pounds ');%input data
while isempty(ib) || ib <1%repeat the request if the input fails
ib=input('invalid value\nenter mass in pounds ');%input data
end
kg=ib*0.4536;%calculate data
fprintf('the anser is %1.3f kilograms\n',kg)%print data

    case 't'%tonne to ton
        tonne=input('enter mass in tonne(metric) ');%input data
while isempty(tonne) || tonne <1%repeat the request if the input fails
tonne=input('invalid value\nenter mass in tonne(metric) ');%input data
end
ton=tonne/1.016;%calculate data
fprintf('the anser is %1.3f ton(imperial)\n',ton)%print data

    case 'n'%ton to tonne
        ton=input('enter mass in ton(imperial) ');%input data
while isempty(ton) || ton <1%repeat the request if the input fails
ton=input('invalid value\nenter mass in ton(imperial) ');%input data
end
tonne=ton*1.016;%calculate data
fprintf('the anser is %1.3f tonne(metric)\n',tonne)%print data
end
end