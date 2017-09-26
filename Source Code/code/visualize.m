%% Visualize of the Datasets in 2 Dimensions 
% This Script reduces the dimensions of the datasets to two dimensions to plot the datasets.
% the tsne Algorithm with the euclidean distance is used for the
% reduction.

load ../data/Reuters/org_vs_people_1;
Xs = Xs';
Xt = Xt';
lossComp = [];
[T,loss]  = tsne(full(Xs),'Algorithm','exact','Distance','euclidean','NumDimensions',2);
plotData(T,Ys,{'Orgs','People'},['Plot of the train Data from Org vs People 1 in 2 Dim with kl-loss of ' num2str(loss)]);
lossComp = [lossComp; loss];

[T,loss]  = tsne(full(Xt),'Algorithm','exact','Distance','euclidean','NumDimensions',2);
plotData(T,Yt,{'Orgs','People'},['Plot of the test Data from Org vs People 1 in 2 Dim with kl-loss of ' num2str(loss)]);
lossComp = [lossComp; loss];

load ../data/Reuters/org_vs_people_2;
Xs = Xs';
Xt = Xt';

[T,loss]  = tsne(full(Xs),'Algorithm','exact','Distance','euclidean','NumDimensions',2);
plotData(T,Ys,{'Org','People'},['Plot of the train Data from Org vs People 2 in 2 Dim with kl-loss of ' num2str(loss)]);
lossComp = [lossComp; loss];
[T,loss]  = tsne(full(Xt),'Algorithm','exact','Distance','euclidean','NumDimensions',2);
plotData(T,Yt,{'Org','People'},['Plot of the test Data from Org vs People 2 in 2 Dim with kl-loss of ' num2str(loss)]);
lossComp = [lossComp; loss];

load ../data/20Newsgroup/comp_vs_rec_1;
Xs = Xs';
Xt = Xt';

[T,loss]  = tsne(full(Xs),'Algorithm','exact','Distance','euclidean','NumDimensions',2);
plotData(T,Ys,{'Comp','Rec'},['Plot of the train Data from Comp vs Rec 1 in 2 Dim with kl-loss of ' num2str(loss)]);
lossComp = [lossComp; loss];
[T,loss]  = tsne(full(Xt),'Algorithm','exact','Distance','euclidean','NumDimensions',2);
plotData(T,Yt,{'Comp','Rec'},['Plot of the test Data from Comp vs Rec 1 in 2 Dim with kl-loss of ' num2str(loss)]);
lossComp = [lossComp; loss];
load ../data/OfficeCaltech/Caltech10_SURF_L10.mat;
Xc = fts ./ repmat(sum(fts, 2), 1, size(fts, 2));
Yc = ones(size(Xc,1),1);
lossComp = [lossComp; loss];
load ../data/OfficeCaltech/amazon_SURF_L10.mat;
Xa = fts ./ repmat(sum(fts, 2), 1, size(fts, 2));
Ya = ones(size(Xa,1),1)*2;
lossComp = [lossComp; loss];
load ../data/OfficeCaltech/dslr_SURF_L10.mat;
Xw = fts ./ repmat(sum(fts, 2), 1, size(fts, 2));
Yw = ones(size(Xw,1),1)*3;
lossComp = [lossComp; loss];
load ../data/OfficeCaltech/webcam_SURF_L10.mat;
Xd = fts ./ repmat(sum(fts, 2), 1, size(fts, 2));
Yd = ones(size(Xd,1),1)*4;
lossComp = [lossComp; loss];
X = [Xc; Xa; Xw; Xd];
Y = [Yc; Ya; Yw; Yd];
lossComp = [lossComp; loss];

[T,loss]  = tsne(full(X),'Algorithm','exact','Distance','euclidean','NumDimensions',2);
plotData(T,Y,{'Caltech','Amazon','dslr','webcam'},[]);
lossComp = [lossComp; loss];
save('KL-Loss_TSNE','lossComp');

function [] = plotData(X,Y,categories,titleText)
    
    cc = [1 0 0; 0 0 1;1 0 1;0 1 0];
    figure;
    gscatter(X(:,1),X(:,2),Y,cc);

    hold on;
    if size(categories,2) == 4
    legend(categories{1},categories{2},categories{3},categories{4});
    else
         legend(categories{1},categories{2});
    end
%     title(titleText);

end
