% clear all
% clc
% close all
% 
% %Lectura de las imagenes
% C = []; 
% figure(1)
% 
% %Conjunto de imagenes como base de datos
% for i = 1:4
%     %Imagenes de playa
%     nameVar = ['beach' num2str(i) '.jpg'];
%     Ikp = imread(nameVar); %Carga la imagen como variable (tipo matriz)
%     Ik = Ikp(:, :, 1);
%     Ic{i} = Ik; %La almacena en el cell array con todas las imagenes
%     if i ~= 1
%         C = [C, Ik(:)]; %Guarda la imagen en una matriz de columnas
%         subplot(4, 4, i)
%         imshow(Ik)
%         %A efectos del ejercicio, se obvia la primera imagen, que sera
%         %usada para la comparacion
%     end
%     
%     %Imagenes de campo
%     nameVar = ['field' num2str(i) '.jpg'];
%     Ikp = imread(nameVar); %Carga la imagen como variable (tipo matriz)
%     Ik = Ikp(:, :, 1);
%     Ic{i + 4} = Ik; %La almacena en el cell array con todas las imagenes
%     C = [C, Ik(:)]; %Guarda la imagen en una matriz de columnas
%     subplot(4, 4, i + 4)
%     imshow(Ik)
%     
%     %Imagenes de bosque
%     nameVar = ['forest' num2str(i) '.jpg'];
%     Ikp = imread(nameVar); %Carga la imagen como variable (tipo matriz)
%     Ik = Ikp(:, :, 1);
%     Ic{i + 8} = Ik; %La almacena en el cell array con todas las imagenes
%     C = [C, Ik(:)]; %Guarda la imagen en una matriz de columnas
%     subplot(4, 4, i + 8)
%     imshow(Ik)
%     
%     %Imagenes de mar
%     nameVar = ['sea' num2str(i) '.jpg'];
%     Ikp = imread(nameVar); %Carga la imagen como variable (tipo matriz)
%     Ik = Ikp(:, :, 1);
%     Ic{i + 12} = Ik; %La almacena en el cell array con todas las imagenes
%     C = [C, Ik(:)]; %Guarda la imagen en una matriz de columnas
%     subplot(4, 4, i + 12)
%     imshow(Ik)
% end
% 
% %Imagen a proyectar para comparar 
% ICompp = imread('beach1.jpg');
% IComp = ICompp(:, :, 1);
% figure(2)
% imshow(IComp)
% 
% %Conversion a vector columna para los calculos, conversion a double
% b = double(IComp(:)); 
% C = double(C);
% 
% %Resolucion del sistema C * a = b
% a = C\b(:);
% 
% %Determinacion de la imagen mas parecida a la de comparacion
% valComp = 0;
% imVal = 0;
% 
% for i = 1:size(a)
%     if a(i) > valComp
%         valComp = a(i);
%         imVal = i;
%     end
% end
% 
% fprintf('La imagen de mayor similitud es la %d.\n', imVal);
% 
% pause

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
CPCAR = [];
CPCAG = [];
CPCAB = [];
figure(1)

%Conjunto de imagenes como base de datos

%Canal rojo
for i = 1:4
    %Imagenes de playa
    nameVar = ['beach' num2str(i) '.jpg'];
    Ikp = imread(nameVar); %Carga la imagen como variable (tipo matriz)
    Ik = Ikp(:, :, 1);
    IkM = Ik(axisXInf:axisXSup, axisYInf:axisYSup); %Aplica la mascara definida
    Ic{i} = IkM; %Se almacena en un cell array
    CPCAR = [CPCAR, IkM(:)]; %Guarda la nueva imagen en una matriz de columnas
    subplot(4, 4, i)
    imshow(Ik)
    
    %Imagenes de campo
    nameVar = ['field' num2str(i) '.jpg'];
    Ikp = imread(nameVar); %Carga la imagen como variable (tipo matriz)
    Ik = Ikp(:, :, 1);
    IkM = Ik(axisXInf:axisXSup, axisYInf:axisYSup); %Aplica la mascara definida
    Ic{i + 4} = IkM; %Se almacena en un cell array
    CPCAR = [CPCAR, IkM(:)]; %Guarda la nueva imagen en una matriz de columnas
    subplot(4, 4, i + 4)
    imshow(Ik)
    
    %Imagenes de bosque
    nameVar = ['forest' num2str(i) '.jpg'];
    Ikp = imread(nameVar); %Carga la imagen como variable (tipo matriz)
    Ik = Ikp(:, :, 1);
    IkM = Ik(axisXInf:axisXSup, axisYInf:axisYSup); %Aplica la mascara definida
    Ic{i + 8} = IkM; %Se almacena en un cell array
    CPCAR = [CPCAR, IkM(:)]; %Guarda la nueva imagen en una matriz de columnas
    subplot(4, 4, i + 8)
    imshow(Ik)
    
    %Imagenes de mar
    nameVar = ['sea' num2str(i) '.jpg'];
    Ikp = imread(nameVar); %Carga la imagen como variable (tipo matriz)
    Ik = Ikp(:, :, 1);
    IkM = Ik(axisXInf:axisXSup, axisYInf:axisYSup); %Aplica la mascara definida
    Ic{i + 12} = IkM; %Se almacena en un cell array
    CPCAR = [CPCAR, IkM(:)]; %Guarda la nueva imagen en una matriz de columnas
    subplot(4, 4, i + 12)
    imshow(Ik)
end

%Matriz X de PCA (muestras por filas)
XR = double(CPCAR'); 
meanXR = mean(XR); %Media de los valores de cada columna
MXR = repmat(meanXR, size(XR, 1), 1); %Regenera las columnas con meanX
XCR = XR - MXR; %Matriz centrada 

BR = XCR' * XCR; %Matriz de correspondencia por filas
[PR, DR] = eig(BR); %Se diagonaliza

%------------------------------------------------
%------------------------------------------------

%Canal verde
for i = 1:4
    %Imagenes de playa
    nameVar = ['beach' num2str(i) '.jpg'];
    Ikp = imread(nameVar); %Carga la imagen como variable (tipo matriz)
    Ik = Ikp(:, :, 2);
    IkM = Ik(axisXInf:axisXSup, axisYInf:axisYSup); %Aplica la mascara definida
    Ic{i} = IkM; %Se almacena en un cell array
    CPCAG = [CPCAG, IkM(:)]; %Guarda la nueva imagen en una matriz de columnas
    subplot(4, 4, i)
    imshow(Ik)
    
    %Imagenes de campo
    nameVar = ['field' num2str(i) '.jpg'];
    Ikp = imread(nameVar); %Carga la imagen como variable (tipo matriz)
    Ik = Ikp(:, :, 2);
    IkM = Ik(axisXInf:axisXSup, axisYInf:axisYSup); %Aplica la mascara definida
    Ic{i + 4} = IkM; %Se almacena en un cell array
    CPCAG = [CPCAG, IkM(:)]; %Guarda la nueva imagen en una matriz de columnas
    subplot(4, 4, i + 4)
    imshow(Ik)
    
    %Imagenes de bosque
    nameVar = ['forest' num2str(i) '.jpg'];
    Ikp = imread(nameVar); %Carga la imagen como variable (tipo matriz)
    Ik = Ikp(:, :, 2);
    IkM = Ik(axisXInf:axisXSup, axisYInf:axisYSup); %Aplica la mascara definida
    Ic{i + 8} = IkM; %Se almacena en un cell array
    CPCAG = [CPCAG, IkM(:)]; %Guarda la nueva imagen en una matriz de columnas
    subplot(4, 4, i + 8)
    imshow(Ik)
    
    %Imagenes de mar
    nameVar = ['sea' num2str(i) '.jpg'];
    Ikp = imread(nameVar); %Carga la imagen como variable (tipo matriz)
    Ik = Ikp(:, :, 2);
    IkM = Ik(axisXInf:axisXSup, axisYInf:axisYSup); %Aplica la mascara definida
    Ic{i + 12} = IkM; %Se almacena en un cell array
    CPCAG = [CPCAG, IkM(:)]; %Guarda la nueva imagen en una matriz de columnas
    subplot(4, 4, i + 12)
    imshow(Ik)
end

%Matriz X de PCA (muestras por filas)
XG = double(CPCAG'); 
meanXG = mean(XG); %Media de los valores de cada columna
MXG = repmat(meanXG, size(XG, 1), 1); %Regenera las columnas con meanX
XCG = XG - MXG; %Matriz centrada 

BG = XCG' * XCG; %Matriz de correspondencia por filas
[PG, DG] = eig(BG); %Se diagonaliza

%------------------------------------------------
%------------------------------------------------

%Canal azul
for i = 1:4
    %Imagenes de playa
    nameVar = ['beach' num2str(i) '.jpg'];
    Ikp = imread(nameVar); %Carga la imagen como variable (tipo matriz)
    Ik = Ikp(:, :, 3);
    IkM = Ik(axisXInf:axisXSup, axisYInf:axisYSup); %Aplica la mascara definida
    Ic{i} = IkM; %Se almacena en un cell array
    CPCAB = [CPCAB, IkM(:)]; %Guarda la nueva imagen en una matriz de columnas
    subplot(4, 4, i)
    imshow(Ik)
    
    %Imagenes de campo
    nameVar = ['field' num2str(i) '.jpg'];
    Ikp = imread(nameVar); %Carga la imagen como variable (tipo matriz)
    Ik = Ikp(:, :, 3);
    IkM = Ik(axisXInf:axisXSup, axisYInf:axisYSup); %Aplica la mascara definida
    Ic{i + 4} = IkM; %Se almacena en un cell array
    CPCAB = [CPCAB, IkM(:)]; %Guarda la nueva imagen en una matriz de columnas
    subplot(4, 4, i + 4)
    imshow(Ik)
    
    %Imagenes de bosque
    nameVar = ['forest' num2str(i) '.jpg'];
    Ikp = imread(nameVar); %Carga la imagen como variable (tipo matriz)
    Ik = Ikp(:, :, 3);
    IkM = Ik(axisXInf:axisXSup, axisYInf:axisYSup); %Aplica la mascara definida
    Ic{i + 8} = IkM; %Se almacena en un cell array
    CPCAB = [CPCAB, IkM(:)]; %Guarda la nueva imagen en una matriz de columnas
    subplot(4, 4, i + 8)
    imshow(Ik)
    
    %Imagenes de mar
    nameVar = ['sea' num2str(i) '.jpg'];
    Ikp = imread(nameVar); %Carga la imagen como variable (tipo matriz)
    Ik = Ikp(:, :, 3);
    IkM = Ik(axisXInf:axisXSup, axisYInf:axisYSup); %Aplica la mascara definida
    Ic{i + 12} = IkM; %Se almacena en un cell array
    CPCAB = [CPCAB, IkM(:)]; %Guarda la nueva imagen en una matriz de columnas
    subplot(4, 4, i + 12)
    imshow(Ik)
end

%Matriz X de PCA (muestras por filas)
XB = double(CPCAB'); 
meanXB = mean(XB); %Media de los valores de cada columna
MXB = repmat(meanXB, size(XB, 1), 1); %Regenera las columnas con meanX
XCB = XB - MXB; %Matriz centrada 

BB = XCB' * XCB; %Matriz de correspondencia por filas
[PB, DB] = eig(BB); %Se diagonaliza

%-------------------------------------------

nIm = size(XR, 1); %Numero de imagenes en total
figure(2)

%Para autovalores
for j = 1:nIm 
    pcaR{j} = PR(:, end - j + 1);
    pcaG{j} = PG(:, end - j + 1);
    pcaB{j} = PB(:, end - j + 1);
    subplot(4, 4, j)
    pcak = zeros(axisXSup - axisXInf + 1, axisYSup - axisYInf + 1, 3);
    
    pcak(:, :, 1) = reshape(pcaR{j}, size(Ic{1}));
    pcak(:, :, 2) = reshape(pcaG{j}, size(Ic{1}));
    pcak(:, :, 3) = reshape(pcaB{j}, size(Ic{1}));
    
    imagesc(pcak)
end

v1R = pcaR{1};
v2R = pcaR{2};
VR = [v1R(:) v2R(:)];
coorR = XCR * VR;

v1G = pcaG{1};
v2G = pcaG{2};
VG = [v1G(:) v2G(:)];
coorG = XCG * VG;

v1B = pcaB{1};
v2B = pcaB{2};
VB = [v1B(:) v2B(:)];
coorB = XCB * VB;

coor = zeros(nIm, 2, 3);
coor(:, :, 1) = coorR;
coor(:, :, 2) = coorG;
coor(:, :, 3) = coorB;

figure(3)
hold on
plot(coorR(:, 1), coorR(:, 2), 'o')
plot(coorG(:, 1), coorG(:, 2), 'o')
plot(coorB(:, 1), coorB(:, 2), 'o')

for k = 1:16
    text(coorR(k, 1) + 0.05, coorR(k, 2) + 0.05, num2str(k));
    text(coorG(k, 1) + 0.05, coorG(k, 2) + 0.05, num2str(k));
    text(coorB(k, 1) + 0.05, coorB(k, 2) + 0.05, num2str(k));
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