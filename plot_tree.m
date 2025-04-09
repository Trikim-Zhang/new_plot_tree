clear;
close all;
clc;
%% ��ȡ����
fileID = 'branching_history.csv';
[node, group, S] = read_branching(fileID);
%% ��ͼ
% ���� figure
tree = figure('InvertHardcopy','off','Color',[1 1 1],...
    'Renderer','painters');
% ���� axes
axes = axes('Parent',tree);
set(axes,'LineWidth',1);
new_plot_tree(node, group, S);