clear all
clc
close all
%Leer la base de datos de caras
C = []; %Matriz total
figure(1) %Wa (revisar)

%Generar la matriz C que tiene a las caras como columnas
for k = 1:10 
    
    if k < 10
         namek = ['Cara0' num2str(k) '.pgm']; %Permite cargar el nombre, concatena elementos en forma de String
    else
         namek = ['Cara' num2str(k) '.pgm'];
    end
    
%     namek = ['Cara0' num2str(k) '.pgm']; %Permite cargar el nombre, concatena elementos en forma de String
    Ik = imread(namek); %Carga la imagen como variable (matriz)
    Ic{k} = Ik; %Cell array
    Ikc = Ik;
    C = [C, Ikc(:)]; %Añade a C cada imagen, en su forma matricial de columna (C sera matriz de todas las imagenes, en columnas)
    subplot(2, 5, k)
    imshow(Ik);
end

%-----------------------------------
pause

%Matriz X de PCA (muestras por filas)
X = double(C'); %Traspuesta para poder usar el mean() (que hace la media de una columna a un solo valor)
meanX = mean(X);
MX = repmat(meanX, size(X, 1), 1);
XC = X - MX; %Matriz centrada (?) Se le resta la media a los valores

figure
imagesc(XC)

%-----------------------------------
pause

B = XC' * XC; %Matriz de correspondencia por filas mencionada en anotaciones
[P, D] = eig(B); %Tratamos de diagonalizar
espectro = diag(D);
ncaras = size(X, 1);
espectroN = espectro(end:-1:end-ncaras+1); %Si hay 10 caras, va desde end hasta la 10-penultima cara
plot(espectroN, 'o')

%-----------------------------------
pause

%Para autovalores
for k = 1:ncaras
    pca{k} = P(:, end-k+1);
    subplot(2, 5, k)
    pcak = reshape(pca{k}, size(Ic{1}));
    imagesc(pcak)
end

v1 = pca{1};
v2 = pca{2};
V = [v1(:) v2(:)];
coor = XC * V;

figure
plot(coor(:, 1), coor(:, 2), 'o')
hold on

%-----------------------------------
pause

for k = 1:10
    text(coor(k, 1) + 0.001, coor(k, 2) + 0.001, num2str(k));
end

Idx = kmeans(coor, 2);
c1 = find(Idx == 1);
c2 = find(Idx == 2);
plot(coor(c1, 1), coor(c1, 2), 'r*')

%-----------------------------------
pause

plot(coor(c2, 1), coor(c2, 2), 'mo')

