%% Teste A

N = 128;
x = linspace(0, 1, N + 1);
U = readmatrix('OutputA128.txt');
p = 0.35;
i = floor(N*p+1/2)+1;

figure;
hold
title("Teste A");
plot(x, U(:,1));
plot(x, U(:,2));
plot(x(i), U(i,1),'bo');
legend('uT Medido','uT Reconstruido', 'Fonte')
xlabel('0 < x < 1') 
ylabel('Temperatura')
saveas(gcf,'FigA128.png')

%% Teste B

N = 128;
x = linspace(0, 1, N + 1);
U = readmatrix('OutputB128.txt');
p = [0.15; 0.30; 0.70; 0.80];
i = floor(N*p+1/2)+1;

figure;
hold
title("Teste B");
plot(x, U(:,1));
plot(x, U(:,2));
plot(x(i), U(i,1),'bo');
legend('uT Medido','uT Reconstruido', 'Fontes')
xlabel('0 < x < 1') 
ylabel('Temperatura')
saveas(gcf,'FigB128.png')

%% Para os testes C e D
p = [0.15; 0.20; 0.30; 0.35; 0.50; 0.60; 0.70; 0.73; 0.85; 0.90];

%% Teste C
N = 128;
i = floor(N*p+1/2)+1;
x = linspace(0, 1, N + 1);
U = readmatrix("OutputC" + N + ".txt");

figure;
hold
title("Teste C com N = " + N);
plot(x, U(:,1));
plot(x, U(:,2));
plot(x(i), U(i,1),'bo');
legend('uT Medido','uT Reconstruido', 'Fontes')
xlabel('0 < x < 1') 
ylabel('Temperatura')
saveas(gcf,"FigC" + N + ".png")

%% Teste C
N = 256;
i = floor(N*p+1/2)+1;
x = linspace(0, 1, N + 1);
U = readmatrix("OutputC" + N + ".txt");

figure;
hold
title("Teste C com N = " + N);
plot(x, U(:,1));
plot(x, U(:,2));
plot(x(i), U(i,1),'bo');
legend('uT Medido','uT Reconstruido', 'Fontes')
xlabel('0 < x < 1') 
ylabel('Temperatura')
saveas(gcf,"FigC" + N + ".png")

%% Teste C
N = 512;
i = floor(N*p+1/2)+1;
x = linspace(0, 1, N + 1);
U = readmatrix("OutputC" + N + ".txt");

figure;
hold
title("Teste C com N = " + N);
plot(x, U(:,1));
plot(x, U(:,2));
plot(x(i), U(i,1),'bo');
legend('uT Medido','uT Reconstruido', 'Fontes')
xlabel('0 < x < 1') 
ylabel('Temperatura')
saveas(gcf,"FigC" + N + ".png")

%% Teste C
N = 1024;
i = floor(N*p+1/2)+1;
x = linspace(0, 1, N + 1);
U = readmatrix("OutputC" + N + ".txt");

figure;
hold
title("Teste C com N = " + N);
plot(x, U(:,1));
plot(x, U(:,2));
plot(x(i), U(i,1),'bo');
legend('uT Medido','uT Reconstruido', 'Fontes')
xlabel('0 < x < 1') 
ylabel('Temperatura')
saveas(gcf,"FigC" + N + ".png")

%% Teste C
N = 2048;
i = floor(N*p+1/2)+1;
x = linspace(0, 1, N + 1);
U = readmatrix("OutputC" + N + ".txt");

figure;
hold
title("Teste C com N = " + N);
plot(x, U(:,1));
plot(x, U(:,2));
plot(x(i), U(i,1),'bo');
legend('uT Medido','uT Reconstruido', 'Fontes')
xlabel('0 < x < 1') 
ylabel('Temperatura')
saveas(gcf,"FigC" + N + ".png")

%% Teste D
N = 128;
i = floor(N*p+1/2)+1;
x = linspace(0, 1, N + 1);
U = readmatrix("OutputD" + N + ".txt");

figure;
hold
title("Teste D com N = " + N);
plot(x, U(:,1));
plot(x, U(:,2));
plot(x(i), U(i,1),'bo');
legend('uT Medido','uT Reconstruido', 'Fontes')
xlabel('0 < x < 1') 
ylabel('Temperatura')
saveas(gcf,"FigD" + N + ".png")

%% Teste D
N = 256;
i = floor(N*p+1/2)+1;
x = linspace(0, 1, N + 1);
U = readmatrix("OutputD" + N + ".txt");

figure;
hold
title("Teste D com N = " + N);
plot(x, U(:,1));
plot(x, U(:,2));
plot(x(i), U(i,1),'bo');
legend('uT Medido','uT Reconstruido', 'Fontes')
xlabel('0 < x < 1') 
ylabel('Temperatura')
saveas(gcf,"FigD" + N + ".png")

%% Teste D
N = 512;
i = floor(N*p+1/2)+1;
x = linspace(0, 1, N + 1);
U = readmatrix("OutputD" + N + ".txt");

figure;
hold
title("Teste D com N = " + N);
plot(x, U(:,1));
plot(x, U(:,2));
plot(x(i), U(i,1),'bo');
legend('uT Medido','uT Reconstruido', 'Fontes')
xlabel('0 < x < 1') 
ylabel('Temperatura')
saveas(gcf,"FigD" + N + ".png")

%% Teste D
N = 1024;
i = floor(N*p+1/2)+1;
x = linspace(0, 1, N + 1);
U = readmatrix("OutputD" + N + ".txt");

figure;
hold
title("Teste D com N = " + N);
plot(x, U(:,1));
plot(x, U(:,2));
plot(x(i), U(i,1),'bo');
legend('uT Medido','uT Reconstruido', 'Fontes')
xlabel('0 < x < 1') 
ylabel('Temperatura')
saveas(gcf,"FigD" + N + ".png")

%% Teste D
N = 2048;
i = floor(N*p+1/2)+1;
x = linspace(0, 1, N + 1);
U = readmatrix("OutputD" + N + ".txt");

figure;
hold
title("Teste D com N = " + N);
plot(x, U(:,1));
plot(x, U(:,2));
plot(x(i), U(i,1),'bo');
legend('uT Medido','uT Reconstruido', 'Fontes')
xlabel('0 < x < 1') 
ylabel('Temperatura')
saveas(gcf,"FigD" + N + ".png")