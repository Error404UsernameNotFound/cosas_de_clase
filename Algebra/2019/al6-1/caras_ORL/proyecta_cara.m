clear all
clc
close all
%Leer la base de datos de caras
C = []; %Matriz total
Ct = [];
figure(1) %Wa (revisar)
mask = [30:70, 20:70]; %Mascara para la representacion de imagenes
%Leer caras 1-9
for k = 1:10 %1:9 con el comentado de abajo
    
    if k < 10
         namek = ['Cara0' num2str(k) '.pgm']; %Permite cargar el nombre, concatena elementos en forma de String
    else
         namek = ['Cara' num2str(k) '.pgm'];
    end
    
%     namek = ['Cara0' num2str(k) '.pgm']; %Permite cargar el nombre, concatena elementos en forma de String
    Ik = imread(namek); %Carga la imagen como variable (matriz)
    Ic{k} = Ik; %Cell array
    Ikc = Ik(mask); %Aplico la mascara
    C = [C, Ikc(:)]; %Añade a C cada imagen, en su forma matricial de columna (C sera matriz de todas las imagenes, en columnas)
    Ct = [Ct, Ik(:)]; %Aqio ya me perdi
    subplot(2, 5, k)
    imshow(Ik);
end
% %Leer cara 10
% Ik = imread('Cara10.pgm');
% I{k + 1} = I10;
% subplot(2, 5, k);
% imshow(I10);
% C = [C, I10(:)];

%Leer la cara a proyectar
I11 = imread('Cara19.pgm');
figure(2)
imshow(I11)
I11c = I11(mask); %Aplico la mascara

b = double(I11c(:)); %Vector columna de la matroz de la imagen // necesitamos que sea un double
C = double(C); %Same as arriba
Ct = double(Ct); %Mas perdida
%Resolver el sistema [C * a = b] en el sentido de los minimos cuadrados
%(CT * C * a = CT * b)
% a = inv(C' * C) * C' * b(:); %Mismo que la linea inferior
% a = pinv(C) * b(:);
a = C\b(:);

%Individuo proyectado
p = round(Ct * a); %Se pasa a numeros naturales
Ip = reshape(p, size(Ic{1}));
figure(3)
imagesc(Ip)
