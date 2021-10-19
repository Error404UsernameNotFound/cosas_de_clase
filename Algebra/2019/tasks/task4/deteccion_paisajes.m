clear all
clc
close all

%Lectura de las imagenes
C = []; 
figure(1)

%Conjunto de imagenes como base de datos
for i = 1:4
    %Imagenes de playa
    nameVar = ['beach' num2str(i) '.jpg'];
    Ik = imread(nameVar); %Carga la imagen como variable (tipo matriz)
    Ic{i} = Ik; %La almacena en el cell array con todas las imagenes
    if i ~= 1
        C = [C, Ik(:)]; %Guarda la imagen en una matriz de columnas
        subplot(4, 4, i)
        imshow(Ik)
        %A efectos del ejercicio, se obvia la primera imagen, que sera
        %usada para la comparacion
    end
    
    %Imagenes de campo
    nameVar = ['field' num2str(i) '.jpg'];
    Ik = imread(nameVar); %Carga la imagen como variable (matriz)
    Ic{i + 4} = Ik; %La almacena en el cell array con todas las imagenes
    C = [C, Ik(:)]; %Guarda la imagen en una matriz de columnas
    subplot(4, 4, i + 4)
    imshow(Ik)
    
    %Imagenes de bosque
    nameVar = ['forest' num2str(i) '.jpg'];
    Ik = imread(nameVar); %Carga la imagen como variable (matriz)
    Ic{i + 8} = Ik; %La almacena en el cell array con todas las imagenes
    C = [C, Ik(:)]; %Guarda la imagen en una matriz de columnas
    subplot(4, 4, i + 8)
    imshow(Ik)
    
    %Imagenes de mar
    nameVar = ['sea' num2str(i) '.jpg'];
    Ik = imread(nameVar); %Carga la imagen como variable (matriz)
    Ic{i + 12} = Ik; %La almacena en el cell array con todas las imagenes
    C = [C, Ik(:)]; %Guarda la imagen en una matriz de columnas
    subplot(4, 4, i + 12)
    imshow(Ik)
end
 
%Imagen a proyectar para comparar 
IComp = imread('beach1.jpg');
figure(2)
imshow(IComp)
 
%Conversion a vector columna para los calculos, conversion a double
b = double(IComp(:)); 
C = double(C);
 
%Resolucion del sistema C * a = b
a = C\b(:);
 
%Determinacion de la imagen mas parecida a la de comparacion
valComp = 0;
imVal = 0;
 
for i = 1:size(a)
    if a(i) > valComp
        valComp = a(i);
        imVal = i;
    end
end
 
fprintf('La imagen de mayor similitud es la %d.\n', imVal);
 
pause

%--------------------------------------------------------------------------
%
%--------------------------------------------------------------------------

clear all
clc
close all

%Generacion de una mascara para las imagenes a tratar
%Sigue las indicaciones propuestas en el ejercicio
axisXInf = randi([100 151], 1);
axisXSup = randi([(axisXInf + 49) 200], 1);
axisYInf = randi([100 151], 1);
axisYSup = randi([(axisXInf + 49) 200], 1);
% mask = [axisXInf:axisXSup, axisYInf:axisYSup];

%Lectura de imagenes y uso de la mascara
CPCA = [];
figure(1)

%Conjunto de imagenes como base de datos
for i = 1:4
    %Imagenes de playa
    nameVar = ['beach' num2str(i) '.jpg'];
    Ik = imread(nameVar); %Carga la imagen como variable (tipo matriz)
    IkM = Ik(axisXInf:axisXSup, axisYInf:axisYSup, :); %Aplica la mascara definida
    Ic{i} = IkM; %Se almacena en un cell array
    CPCA = [CPCA, IkM(:)]; %Guarda la nueva imagen en una matriz de columnas
    subplot(4, 4, i)
    imshow(Ik)
    
    %Imagenes de campo
    nameVar = ['field' num2str(i) '.jpg'];
    Ik = imread(nameVar); %Carga la imagen como variable (tipo matriz)
    IkM = Ik(axisXInf:axisXSup, axisYInf:axisYSup, :); %Aplica la mascara definida
    Ic{i + 4} = IkM; %Se almacena en un cell array
    CPCA = [CPCA, IkM(:)]; %Guarda la nueva imagen en una matriz de columnas
    subplot(4, 4, i + 4)
    imshow(Ik)
    
    %Imagenes de bosque
    nameVar = ['forest' num2str(i) '.jpg'];
    Ik = imread(nameVar); %Carga la imagen como variable (tipo matriz)
    IkM = Ik(axisXInf:axisXSup, axisYInf:axisYSup, :); %Aplica la mascara definida
    Ic{i + 8} = IkM; %Se almacena en un cell array
    CPCA = [CPCA, IkM(:)]; %Guarda la nueva imagen en una matriz de columnas
    subplot(4, 4, i + 8)
    imshow(Ik)
    
    %Imagenes de mar
    nameVar = ['sea' num2str(i) '.jpg'];
    Ik = imread(nameVar); %Carga la imagen como variable (tipo matriz)
    IkM = Ik(axisXInf:axisXSup, axisYInf:axisYSup, :); %Aplica la mascara definida
    Ic{i + 12} = IkM; %Se almacena en un cell array
    CPCA = [CPCA, IkM(:)]; %Guarda la nueva imagen en una matriz de columnas
    subplot(4, 4, i + 12)
    imshow(Ik)
end

%Matriz X de PCA (muestras por filas)
X = double(CPCA'); 
meanX = mean(X); %Media de los valores de cada columna
MX = repmat(meanX, size(X, 1), 1); %Regenera las columnas con meanX
XC = X - MX; %Matriz centrada 

B = XC' * XC; %Matriz de correspondencia por filas
[P, D] = eig(B); %Se diagonaliza
nIm = size(X, 1); %Numero de imagenes en total

figure(2)

%Para autovalores
for j = 1:nIm 
    pca{j} = P(:, end - j + 1);
    subplot(4, 4, j)
    pcak = reshape(pca{j}, size(Ic{1}));
    imagesc(pcak)
end

v1 = pca{1};
v2 = pca{2};
V = [v1(:) v2(:)];
coor = XC * V;

figure(3)
plot(coor(:, 1), coor(:, 2), 'o')
hold on

for k = 1:16
    text(coor(k, 1) + 0.05, coor(k, 2) + 0.05, num2str(k));
end

Idx = kmeans(coor, 4);
c1 = find(Idx == 1);
c2 = find(Idx == 2);
c3 = find(Idx == 3);
c4 = find(Idx == 4);
plot(coor(c1, 1), coor(c1, 2), 'r*')
plot(coor(c2, 1), coor(c2, 2), 'm*')
plot(coor(c3, 1), coor(c3, 2), 'k*')
plot(coor(c4, 1), coor(c4, 2), 'y*')

%Genera un indice aleatorio como imagen
randIm = randi([1 nIm], 1);

%Determina el grupo al que pertenece la imagen
for m = 1:4
    if ismember(randIm, find(Idx == m))
        fprintf('La imagen %d pertenece al conjunto c%d.\n', randIm, m);
    end
end