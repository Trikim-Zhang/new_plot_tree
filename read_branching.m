function [node, group, S] = read_branching(fileID)
    % 打开文件
    fileID = fopen(fileID, 'r');

    % 初始化变量
    node = [];
    group = {};
    S = [];

    % 逐行读取文件
    line = fgetl(fileID);
    while ~isequal(line, -1)
        % 按冒号分隔每一行
        parts = strsplit(line, ',');

        % 提取每一列的内容
        node_value = str2double(strtrim(parts{1}));
        group_value = strtrim(parts{2});
        S_value = str2double(strtrim(parts{3}));

        % 将内容存储到对应的变量中
        node = [node; node_value];
        group{end+1} = group_value;
        S = [S; S_value];

        % 读取下一行
        line = fgetl(fileID);
    end
    % 关闭文件
    fclose(fileID);
end

