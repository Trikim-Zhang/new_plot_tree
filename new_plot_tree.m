function new_plot_tree(nodes, group, S)
    [x,y] = treelayout(nodes); 
    leaves = find(y == min(y)); 
    num_layers = 1/min(y)-1; 
    chains = zeros(num_layers, length(leaves)); 
    for l=1:length(leaves) 
        index = leaves(l); 
        chain = []; 
        chain(1) = index; 
        parent_index = nodes(index); 
        j = 2; 
        while (parent_index ~= 0) 
         chain(j) = parent_index; 
         parent_index = nodes(parent_index); 
         j = j+1; 
        end 
        chains(:,l) = padarray(flip(chain), [0, num_layers-length(chain)], 'post'); 
    end 
    y_new = zeros(size(y)); 
    for i=1:length(nodes) 
        [r,c] = find(chains==i, 1); 
        y_new(i) = max(y) - (r-1)*1/(num_layers+1); 
    end
    % --- ���� --- %     
%     plot(x, y_new, 'o'); 
    % ��������ѡ����� $\Delta$ �ĵ�
    delta=1/7;
    idx_greater = S > delta; % ���� $\Delta$ ����������
    idx_less_equal = S <= delta; % С�ڻ���� $\Delta$ ����������
    % ���ƴ��� $\Delta$ �ĵ㣬ʹ�ò�ͬ�ı�Ǻ���ɫ
    h1=scatter(x(idx_greater), y_new(idx_greater),  ...
        'r', 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'none', 'Marker', 's'); % ��ɫ�����Σ����� $\Delta$
    hold on; % ���浱ǰ��ͼ
    % ����С�ڻ���� $\Delta$ �ĵ�
    h2=scatter(x(idx_less_equal), y_new(idx_less_equal),  ...
        'b', 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'none', 'Marker', 'o'); % ��ɫԲ�Σ�С�ڻ���� $\Delta$
    hold on;
    legend([h1, h2], {'$\hat{\beta}>\Delta$', '$\hat{\beta}\leq\Delta$'},...
            'Interpreter','latex','fontsize',8.0, 'AutoUpdate', 'off',...
            'Location', 'best', 'box', 'off');
    % --- ���� --- %  
    for c=1:size(chains, 2) 
        line_x = x(chains(chains(:,c)>0, c)); 
        line_y = y_new(chains(chains(:,c)>0, c)); 
        line(line_x, line_y); 
    end 
    % --- д�� --- % 
    text(x+0.005,y_new+0.01, group,'Interpreter','latex','fontsize',8.0);
    % �� S ת��Ϊ LaTeX ���ʽ
    latex_S = arrayfun(@(s) ['$S^{\mathrm{T}}=' sprintf('%.3g', s) '$'], S, 'UniformOutput', false);
    text(x+0.005, y_new-0.01, latex_S, 'Interpreter','latex','fontsize',8.0);
    % --- д�� --- % 
    xlim([0, 1]); 
    ylim([0, 1]); 
    axis off;
end

