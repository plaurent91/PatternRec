function PlotFeatures()
    
    P = DrawCharacter;
    
    % Resample (not used)
    % P = Resample(P, 0.5, 'linear');
    % Interpolate interstrokes (not used)
    % P = StraightenLiftedStrokes(P);
    
    F = ExtractFeatures(P);
    if all(F(8, :) == 0)
        % No strokes
        return;
    end
    % Exclude non-strokes
    F = F(:, F(8, :) ~= 0);
    % Assert that all consecutive frames for the
    % used features [1, 2, 4, 5] are different
    assert(all(sum(diff(F([1, 2, 4, 5], :), 1, 2) ~= 0, 1) ~= 0));
    
    t = 1:size(F, 2);
    
    subplot(3, 1, 1);
    plot(t, F(1, :), 'b', t, F(2, :), 'g');
    axis([0, size(F, 2), -1.2, 1.2]);
    title('$\cos(\theta), \sin(\theta)$', 'Interpreter', 'LaTex');
    xlabel('t');
    ylabel('Feature value');
    
    subplot(3, 1, 2);
    plot(t, F(4, :), 'r');
    axis([0, size(F, 2), -1.2, 1.2]);
    title('$\sin(d\theta/dt)$', 'Interpreter', 'LaTex');
    xlabel('t');
    ylabel('Feature value');
    
    subplot(3, 1, 3);
    plot(t, F(5, :), 'k');
    axis([0, size(F, 2), -0.2, 1.2]);
    title('Normalized $y$-value', 'Interpreter', 'LaTex');
    xlabel('t');
    ylabel('Feature value');
    
    DisplayCharacter(P);
    
end