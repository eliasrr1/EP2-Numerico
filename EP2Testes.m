%% Teste A

N = 128;
x = linspace(0, 1, N + 1);
U = readmatrix('OutputA128.txt');

figure;
hold
title("Teste A");
plot(x, U(:,1));
plot(x, U(:,2));
legend('uT Medido','uT Reconstruído')

%% Teste B

N = 128;
x = linspace(0, 1, N + 1);
U = readmatrix('OutputB128.txt');

figure;
hold
title("Teste B");
plot(x, U(:,1));
plot(x, U(:,2));
legend('uT Medido','uT Reconstruído')

%% Teste C
N = 128;

x = linspace(0, 1, N + 1);
U = readmatrix("OutputC" + N + ".txt");

figure;
hold
title("Teste C com N = " + N);
plot(x, U(:,1));
plot(x, U(:,2));
legend('uT Medido','uT Reconstruído')

%% Teste C
N = 256;

x = linspace(0, 1, N + 1);
U = readmatrix("OutputC" + N + ".txt");

figure;
hold
title("Teste C com N = " + N);
plot(x, U(:,1));
plot(x, U(:,2));
legend('uT Medido','uT Reconstruído')

%% Teste C
N = 512;

x = linspace(0, 1, N + 1);
U = readmatrix("OutputC" + N + ".txt");

figure;
hold
title("Teste C com N = " + N);
plot(x, U(:,1));
plot(x, U(:,2));
legend('uT Medido','uT Reconstruído')

%% Teste C
N = 1024;

x = linspace(0, 1, N + 1);
U = readmatrix("OutputC" + N + ".txt");

figure;
hold
title("Teste C com N = " + N);
plot(x, U(:,1));
plot(x, U(:,2));
legend('uT Medido','uT Reconstruído')

%% Teste C
N = 2048;

x = linspace(0, 1, N + 1);
U = readmatrix("OutputC" + N + ".txt");

figure;
hold
title("Teste C com N = " + N);
plot(x, U(:,1));
plot(x, U(:,2));
legend('uT Medido','uT Reconstruído')

%% Teste D
N = 128;

x = linspace(0, 1, N + 1);
U = readmatrix("OutputD" + N + ".txt");

figure;
hold
title("Teste D com N = " + N);
plot(x, U(:,1));
plot(x, U(:,2));
legend('uT Medido','uT Reconstruído')

%% Teste D
N = 256;

x = linspace(0, 1, N + 1);
U = readmatrix("OutputD" + N + ".txt");

figure;
hold
title("Teste D com N = " + N);
plot(x, U(:,1));
plot(x, U(:,2));
legend('uT Medido','uT Reconstruído')

%% Teste D
N = 512;

x = linspace(0, 1, N + 1);
U = readmatrix("OutputD" + N + ".txt");

figure;
hold
title("Teste D com N = " + N);
plot(x, U(:,1));
plot(x, U(:,2));
legend('uT Medido','uT Reconstruído')

%% Teste D
N = 1024;

x = linspace(0, 1, N + 1);
U = readmatrix("OutputD" + N + ".txt");

figure;
hold
title("Teste D com N = " + N);
plot(x, U(:,1));
plot(x, U(:,2));
legend('uT Medido','uT Reconstruído')

%% Teste D
N = 2048;

x = linspace(0, 1, N + 1);
U = readmatrix("OutputD" + N + ".txt");

figure;
hold
title("Teste D com N = " + N);
plot(x, U(:,1));
plot(x, U(:,2));
legend('uT Medido','uT Reconstruído')