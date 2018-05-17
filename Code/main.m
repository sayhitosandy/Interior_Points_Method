
close all;
clear;

%% Load Data
load('data.mat');

%% Problem
min   1'u + 1'v
st 
      a'xi + b >=  1 - ui      i=1..N
      a'yj + b <= -1 + vj      j=1..M
      u >= 0
      v >= 0

%% Define Vars

x = []; %Features of Class 1 (Label = 0)
y = []; %Features of Class 2 (Label = 1)

for i=1:size(DB_Vecs,1)
    if (DB_Labels(i) == 0)
        x = [x; -DB_Vecs(i, :)];
    else
        y = [y; DB_Vecs(i, :)];
    end
end

nx = size(x);
ny = size(y);

% Create Matrix A
I1 = eye(nx(1));
I2 = eye(ny(1));
I3 = ones(nx(1),1);
I4 = ones(ny(1),1);
O1 = zeros(nx(1), ny(1));
O2 = O1.';
s = eye(nx(1)+ny(1)); %Slack

%     x, -x,  u,  v,  b,  -b
a1 = [x, -x, -I1, O1, -I3, I3];
a2 = [y, -y, O2, -I2, I4, -I4];
A = [a1; a2];
A = [A, s];
na = size(A);

% b = -1*ones(1, na(1));
b = zeros(1,na(1));
c = [zeros(1,(2*ny(2))), ones(1,(nx(1)+ny(1))),  zeros(1,(nx(1)+ny(1))), 0, 0]; %Cost

%% Call Interior Point Method Function
x = IP(A, b, c);

xk = x(1:nx(2))' - x(nx(2) + 1:2*nx(2))'; %x+ x-
uk = x(2*nx(2) + 1:2*nx(2) + nx(1) + ny(1)); 

%% Predict Labels
res = xk * Q_vecs';
b_new = x(2*nx(2)+nx(1)+ny(1)+1) - x(2*nx(2)+nx(1)+ny(1)+2);
res = res + repmat(b_new,1,689); 
res2 = zeros(1,689);
res2(res <= -1) = 1; %Final Labels

%% Train SVM & Find Accuracy
SVMModel = fitcsvm(DB_Vecs,DB_Labels); %SVM Training
[label,score] = predict(SVMModel,Q_vecs); %Predict using SVM

n = size(find(label' == res2));
disp("Accuracy = " + (n(2)*100/(na(1)+1)) + "%");
