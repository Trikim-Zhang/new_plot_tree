function [node, group, S] = read_branching(fileID)
    % ���ļ�
    fileID = fopen(fileID, 'r');

    % ��ʼ������
    node = [];
    group = {};
    S = [];

    % ���ж�ȡ�ļ�
    line = fgetl(fileID);
    while ~isequal(line, -1)
        % ��ð�ŷָ�ÿһ��
        parts = strsplit(line, ',');

        % ��ȡÿһ�е�����
        node_value = str2double(strtrim(parts{1}));
        group_value = strtrim(parts{2});
        S_value = str2double(strtrim(parts{3}));

        % �����ݴ洢����Ӧ�ı�����
        node = [node; node_value];
        group{end+1} = group_value;
        S = [S; S_value];

        % ��ȡ��һ��
        line = fgetl(fileID);
    end
    % �ر��ļ�
    fclose(fileID);
end

