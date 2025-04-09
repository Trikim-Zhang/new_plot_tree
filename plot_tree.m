clear;
close all;
clc;
%% 读取数据
fileID = 'branching_history.csv';
[node, group, S] = read_branching(fileID);
%% 绘图
% 创建 figure
tree = figure('InvertHardcopy','off','Color',[1 1 1],...
    'Renderer','painters');
% 创建 axes
axes = axes('Parent',tree);
set(axes,'LineWidth',1);
new_plot_tree(node, group, S);