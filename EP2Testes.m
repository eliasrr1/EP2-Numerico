%% Teste A

N = 128;
x = linspace(0, 1, N + 1);
U = readmatrix('OutputA128.txt');
p = 0.35;

figure;
hold
title("Teste A");
scatter(x, U(:,1));
plot(x, U(:,2));
plot(ceil(N*p), U(ceil(N*p),1),'bo');
legend('uT Medido','uT Reconstruído', 'Fonte')
saveas(gcf,'FigA128.png')

%% Teste B

N = 128;
x = linspace(0, 1, N + 1);
U = readmatrix('OutputB128.txt');
p = [0.15; 0.30; 0.70; 0.80];

figure;
hold
title("Teste B");
plot(x, U(:,1));
plot(x, U(:,2));
plot(ceil(N*p), U(ceil(N*p),1),'bo');
legend('uT Medido','uT Reconstruído', 'Fontes')
saveas(gcf,'FigB128.png')

%% Para os testes C e D
p = [0.14999999999999999; 0.20000000000000001; 0.29999999999999999; 0.34999999999999998; 0.50000000000000000
     0.59999999999999998; 0.69999999999999996; 0.72999999999999998; 0.84999999999999998; 0.90000000000000002];

%% Teste C
N = 128;

x = linspace(0, 1, N + 1);
U = readmatrix("OutputC" + N + ".txt");

figure;
hold
title("Teste C com N = " + N);
plot(x, U(:,1));
plot(x, U(:,2));
plot(ceil(N*p), U(ceil(N*p),1),'bo');
legend('uT Medido','uT Reconstruído', 'Fontes')
saveas(gcf,"FigC" + N + ".png")

%% Teste C
N = 256;

x = linspace(0, 1, N + 1);
U = readmatrix("OutputC" + N + ".txt");

figure;
hold
title("Teste C com N = " + N);
plot(x, U(:,1));
plot(x, U(:,2));
plot(ceil(N*p), U(ceil(N*p),1),'bo');
legend('uT Medido','uT Reconstruído', 'Fontes')
saveas(gcf,"FigC" + N + ".png")

%% Teste C
N = 512;

x = linspace(0, 1, N + 1);
U = readmatrix("OutputC" + N + ".txt");

figure;
hold
title("Teste C com N = " + N);
plot(x, U(:,1));
plot(x, U(:,2));
plot(ceil(N*p), U(ceil(N*p),1),'bo');
legend('uT Medido','uT Reconstruído', 'Fontes')
saveas(gcf,"FigC" + N + ".png")

%% Teste C
N = 1024;

x = linspace(0, 1, N + 1);
U = readmatrix("OutputC" + N + ".txt");

figure;
hold
title("Teste C com N = " + N);
plot(x, U(:,1));
plot(x, U(:,2));
plot(ceil(N*p), U(ceil(N*p),1),'bo');
legend('uT Medido','uT Reconstruído', 'Fontes')
saveas(gcf,"FigC" + N + ".png")

%% Teste C
N = 2048;

x = linspace(0, 1, N + 1);
U = readmatrix("OutputC" + N + ".txt");

figure;
hold
title("Teste C com N = " + N);
plot(x, U(:,1));
plot(x, U(:,2));
plot(ceil(N*p), U(ceil(N*p),1),'bo');
legend('uT Medido','uT Reconstruído', 'Fontes')
saveas(gcf,"FigC" + N + ".png")

%% Teste D
N = 128;

x = linspace(0, 1, N + 1);
U = readmatrix("OutputD" + N + ".txt");

figure;
hold
title("Teste D com N = " + N);
plot(x, U(:,1));
plot(x, U(:,2));
plot(ceil(N*p), U(ceil(N*p),1),'bo');
legend('uT Medido','uT Reconstruído', 'Fontes')
saveas(gcf,"FigD" + N + ".pdf")

%% Teste D
N = 256;

x = linspace(0, 1, N + 1);
U = readmatrix("OutputD" + N + ".txt");

figure;
hold
title("Teste D com N = " + N);
plot(x, U(:,1));
plot(x, U(:,2));
plot(ceil(N*p), U(ceil(N*p),1),'bo');
legend('uT Medido','uT Reconstruído', 'Fontes')
saveas(gcf,"FigD" + N + ".pdf")

%% Teste D
N = 512;

x = linspace(0, 1, N + 1);
U = readmatrix("OutputD" + N + ".txt");

figure;
hold
title("Teste D com N = " + N);
plot(x, U(:,1));
plot(x, U(:,2));
plot(ceil(N*p), U(ceil(N*p),1),'bo');
legend('uT Medido','uT Reconstruído', 'Fontes')
saveas(gcf,"FigD" + N + ".pdf")

%% Teste D
N = 1024;

x = linspace(0, 1, N + 1);
U = readmatrix("OutputD" + N + ".txt");

figure;
hold
title("Teste D com N = " + N);
plot(x, U(:,1));
plot(x, U(:,2));
plot(ceil(N*p), U(ceil(N*p),1),'bo');
legend('uT Medido','uT Reconstruído', 'Fontes')
saveas(gcf,"FigD" + N + ".pdf")

%% Teste D
N = 2048;

x = linspace(0, 1, N + 1);
U = readmatrix("OutputD" + N + ".txt");

figure;
hold
title("Teste D com N = " + N);
plot(x, U(:,1));
plot(x, U(:,2));
plot(ceil(N*p), U(ceil(N*p),1),'bo');
legend('uT Medido','uT Reconstruído', 'Fontes')
saveas(gcf,"FigD" + N + ".pdf")