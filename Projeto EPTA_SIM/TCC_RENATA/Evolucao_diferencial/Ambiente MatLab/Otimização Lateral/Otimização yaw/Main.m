 %%%%%%%%%%%% Controle do �ngulo de Arfagem Atrav�s do Profundor %%%%%%
 
 clc
 clear all
 close all
 
 tic;
 
 global C D G H dt % tornando essas vari�veis globais para serem visualizadas  em todo programa
 
 %%% Defini��o do meu modelo em espa�o de estados
 [A B C D]= model(); %"model()" faz o c�lculo do modelo da planta 
 
 %%% Discretiza��o do modelo da planta
 dt=0.02; % tempo de amostragem adotado 0.02s
 [G,H]= convc2d(A,B,dt); %"convc2d()" faz a discretiza��o da planta
 % As matrizes C, D (geralmente D=0), G e H definem o modelo em tempo discreto
 prop=Ev_Dif; %EvDif faz o crit�rio de parada da otimiza��o (devolve os parametros do controlador)
 [Cf,yaw,da,dr,t]=calcadapt(prop);
 
 da=da*180/pi;
 dr=dr*180/pi;
 yaw=yaw*180/pi;
 
figure (1)
plot(t,yaw(1:length(t)),'LineWidth',2)
xlabel('Tempo (s)','FontSize',16)
ylabel('Yaw (m)','FontSize',16)
set(gca,'FontSize',16)

figure (2)
plot(t,da,'LineWidth',2)
xlabel('Tempo (s)','FontSize',16)
ylabel(' Deflex�o Aileron (�)','FontSize',16)
set(gca,'FontSize',16)

figure (3)
plot(t,dr,'LineWidth',2)
xlabel('Tempo (s)','FontSize',16)
ylabel(' Deflex�o Leme (�)','FontSize',16)
set(gca,'FontSize',16)


toc;