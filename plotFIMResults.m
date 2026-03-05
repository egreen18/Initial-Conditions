function plotFIMResults(results, theta0, opts)
    % plotFIMResults  Visualize a Fisher Information Matrix (FIM) and
    %                 FIM-based parameter uncertainty ellipses.
    %
    %   obj.plotFIMResults(fimInput)
    %   obj.plotFIMResults(fimInput, paramNames)
    %   obj.plotFIMResults(fimInput, paramNames, theta0)
    %   obj.plotFIMResults(fimInput, paramNames, theta0, opts)
    %
    %   fimInput   : either an n x n numeric FIM, or a 1x1 cell containing it
    %                e.g., Model_fimTotal = {4x4 double}
    %
    %   paramNames : cell array of parameter names, e.g.,
    %                  {'k_{on}','k_{off}','k_r','k_d'}
    %                If empty or omitted, defaults to {'\theta_1', ..., '\theta_n'}.
    %
    %   theta0     : 1 x n vector of nominal parameter values
    %                (center of ellipses; e.g., log10-parameters).
    %                If empty or omitted, defaults to zeros(1,n).
    %
    %   opts (name-value via arguments block):
    %       .UseLog10        (logical, default true)
    %       .FigureHandle    (default: new figure)
    %       .PlotEllipses    (logical, default true)
    %       .EllipseLevel    (double, default 0.9) – confidence level
    %       .EllipseFigure   (default: new figure)
    %       .EllipsePairs    (default: []) – subset of parameter index pairs
    %                        to plot as ellipses; numeric Kx2 matrix:
    %                        [i1 j1; i2 j2; ...], 1 <= i < j <= nParams
    %
    %       .Colors          (struct or [], default [])
    %           Optional fields:
    %               .HeatmapColormap – colormap handle or name (e.g. parula, 'hot')
    %               .DiagBars        – color for diag(FIM) bars
    %               .EigBars         – color for eigenvalue bars
    %               .Ellipse         – line spec for ellipses (e.g. 'r--')
    %
    %       .Title           (string, default "")
    %       .TitleFontSize   (double, default 14)
    %       .AxisLabelSize   (double, default 14)
    %       .TickLabelSize   (double, default 12)
    %       .LegendFontSize  (double, default 14)   
    %       .LegendLocation  (string, default "best")
    
    arguments
        results
        theta0 = []
        opts.UseLog10 (1,1) logical = true
        opts.FigureHandle = []
        opts.PlotEllipses (1,1) logical = true
        opts.EllipseLevel (1,1) double {mustBePositive} = 0.9
        opts.EllipseFigure = []
        opts.EllipsePairs = []

        opts.Colors = []   
        opts.Title (1,1) string = ""
        opts.TitleFontSize (1,1) double {mustBePositive} = 14
        opts.AxisLabelSize (1,1) double {mustBePositive} = 14
        opts.TickLabelSize (1,1) double {mustBePositive} = 12
        opts.LegendFontSize (1,1) double {mustBePositive} = 14
        opts.LegendLocation (1,1) string = "best"
    end

    % -------- Extract numeric FIM --------
    fimInput = results.fimTotal;
    paramNames = results.parameters;
    if iscell(fimInput)
        fim = fimInput{1};
    else
        fim = fimInput;
    end

    if ~ismatrix(fim) || size(fim,1) ~= size(fim,2)
        error('FIM must be a square matrix or a 1x1 cell containing a square matrix.');
    end

    nParams = size(fim,1);

    % Default parameter names if not provided
    if isempty(paramNames)
        paramNames = arrayfun(@(i) sprintf('\\theta_{%d}', i), ...
                              1:nParams, 'UniformOutput', false);
    end

    % Default theta0 (ellipse centers)
    if isempty(theta0)
        theta0 = zeros(1, nParams);
    end
    if numel(theta0) ~= nParams
        error('theta0 must be a vector of length %d (number of parameters).', nParams);
    end

    % Convenience alias
    C = opts.Colors;

    % -------- Basic spectral info --------
    % Make sure FIM is symmetric (numerical noise)
    fimSym = 0.5 * (fim + fim.');

    [eigVec, eigValMat] = eig(fimSym);
    eigVals = diag(eigValMat);

    % Condition number using positive eigenvalues only
    posEig = eigVals(eigVals > 0);
    if isempty(posEig)
        condInfo = NaN;
    else
        condInfo = max(posEig) / min(posEig);
    end

    % -------- Prepare plotting values --------
    if opts.UseLog10
        % Avoid taking log10 of non-positive values
        epsVal   = 1e-16;
        fimDisp  = log10(max(fimSym, epsVal));
        eigDisp  = log10(max(eigVals, epsVal));
        fimLabel = 'log_{10} FIM';
        eigLabel = 'log_{10} eigenvalues';
    else
        fimDisp  = fimSym;
        eigDisp  = eigVals;
        fimLabel = 'FIM';
        eigLabel = 'Eigenvalues';
    end

    diagInfo = diag(fimSym);

    % -------- Figure for FIM matrix/diag/eigs --------
    % if ~isempty(opts.FigureHandle) && ishghandle(opts.FigureHandle)
    %     fig = opts.FigureHandle;
    %     figure(fig); clf;
    % else
    %     fig = figure;
    % end
    % set(fig, 'Name', 'FIM Results', 'NumberTitle', 'off');
    % 
    % % Optional global title
    % if opts.Title ~= ""
    %     sgtitle(opts.Title, 'FontSize', opts.TitleFontSize, 'FontWeight', 'bold');
    % end
    % 
    % % Layout: 2x2 grid
    % % (1) Heatmap of FIM
    % subplot(2,2,[1 3]); % big panel on left
    % imagesc(fimDisp);
    % axis square;
    % cb = colorbar;
    % if ~isempty(C) && isstruct(C) && isfield(C,'HeatmapColormap')
    %     colormap(C.HeatmapColormap);
    % else
    %     colormap(parula);
    % end
    % set(gca, 'XTick', 1:nParams, 'XTickLabel', paramNames, ...
    %          'YTick', 1:nParams, 'YTickLabel', paramNames, ...
    %          'TickLabelInterpreter', 'tex', ...
    %          'FontSize', opts.TickLabelSize);
    % xlabel('Parameter', 'FontSize', opts.AxisLabelSize);
    % ylabel('Parameter', 'FontSize', opts.AxisLabelSize);
    % title(fimLabel, 'FontSize', opts.AxisLabelSize, 'FontWeight', 'bold');
    % cb.Label.String = fimLabel;
    % cb.Label.FontSize = opts.AxisLabelSize;
    % 
    % % (2) Bar plot of diagonal (per-parameter information)
    % subplot(2,2,2);
    % hBarDiag = bar(diagInfo);
    % if ~isempty(C) && isstruct(C) && isfield(C,'DiagBars')
    %     set(hBarDiag, 'FaceColor', C.DiagBars);
    % end
    % set(gca, 'XTick', 1:nParams, 'XTickLabel', paramNames, ...
    %          'TickLabelInterpreter', 'tex', ...
    %          'FontSize', opts.TickLabelSize);
    % xlabel('Parameter', 'FontSize', opts.AxisLabelSize);
    % ylabel('Diagonal entry of FIM', 'FontSize', opts.AxisLabelSize);
    % title('Per-parameter information (diag(FIM))', ...
    %       'FontSize', opts.AxisLabelSize, 'FontWeight', 'bold');
    % 
    % % (3) Bar plot of eigenvalues
    % subplot(2,2,4);
    % hBarEig = bar(eigDisp);
    % if ~isempty(C) && isstruct(C) && isfield(C,'EigBars')
    %     set(hBarEig, 'FaceColor', C.EigBars);
    % end
    % set(gca, 'FontSize', opts.TickLabelSize);
    % xlabel('Eigenvalue index', 'FontSize', opts.AxisLabelSize);
    % ylabel(eigLabel, 'FontSize', opts.AxisLabelSize);
    % title(sprintf('FIM spectrum (cond. ~ %.2e)', condInfo), ...
    %       'FontSize', opts.AxisLabelSize, 'FontWeight', 'bold');

    % -------- Optional: ellipse plots --------
    if opts.PlotEllipses
        % FIM-based covariance (sanitized inverse using eigen-decomposition)
        epsShift = 1e-12;
        [V,D] = eig(fimSym);
        lam   = diag(D);
        lamSafe = max(lam, epsShift);
        covFIM = V * diag(1 ./ lamSafe) * V.';
        covFIM = 0.5 * (covFIM + covFIM.');   % symmetrize inverse

        % Make or reuse ellipse figure
        if ~isempty(opts.EllipseFigure) && ishghandle(opts.EllipseFigure)
            figEll = opts.EllipseFigure;
            figure(figEll); clf;
        else
            figEll = figure;
        end
        set(figEll, 'Name', 'FIM-based covariance ellipses', 'NumberTitle', 'off');

        if opts.Title ~= ""
            sgtitle(opts.Title, 'FontSize', opts.TitleFontSize, 'FontWeight', 'bold');
        end

        % chi^2 quantile for given confidence level, df=2
        chi2val = icdf('chi2', opts.EllipseLevel, 2);

        ellipsePairs = opts.EllipsePairs;

        % Choose line style for ellipses
        if ~isempty(C) && isstruct(C) && isfield(C,'Ellipse')
            ellipseSpec = C.Ellipse;
        else
            ellipseSpec = 'k-';
        end

        if isempty(ellipsePairs)
            % --- Default: plot all upper-triangular pairs in an (n-1)x(n-1) grid ---
            for iParam = 1:nParams-1
                for jParam = iParam+1:nParams
                    subplot(nParams-1, nParams-1, (iParam-1)*(nParams-1) + jParam-1);

                    % 2x2 sub-covariance and center (order [theta_j, theta_i])
                    subCov = covFIM([jParam iParam],[jParam iParam]);
                    mu     = theta0([jParam iParam]);

                    ssit.parest.ellipse(mu, chi2val * subCov, ellipseSpec, 'LineWidth', 2); hold on;
                    plot(mu(1), mu(2), 'ks', 'MarkerSize', 8, 'MarkerFaceColor', 'w');

                    xlabel(sprintf('%s', paramNames{jParam}), 'Interpreter', 'tex', ...
                           'FontSize', opts.AxisLabelSize);
                    ylabel(sprintf('%s', paramNames{iParam}), 'Interpreter', 'tex', ...
                           'FontSize', opts.AxisLabelSize);
                    set(gca, 'FontSize', opts.TickLabelSize);
                    axis equal; grid on;
                end
            end
        else
            % --- Subset mode: ellipsePairs is Kx2 matrix of [i j] index pairs ---
            if ~ismatrix(ellipsePairs) || size(ellipsePairs,2) ~= 2
                error('EllipsePairs must be a Kx2 numeric matrix of parameter index pairs [i j].');
            end
            K = size(ellipsePairs,1);
            % Layout: as square as possible
            nRows = ceil(sqrt(K));
            nCols = ceil(K / nRows);

            for k = 1:K
                iParam = ellipsePairs(k,1);
                jParam = ellipsePairs(k,2);

                if ~isscalar(iParam) || ~isscalar(jParam) || ...
                        iParam < 1 || jParam < 1 || ...
                        iParam > nParams || jParam > nParams || iParam == jParam
                    error('Invalid EllipsePairs entry at row %d: [%d %d].', k, iParam, jParam);
                end

                subplot(nRows, nCols, k);

                % 2x2 sub-covariance and center (order [theta_j, theta_i])
                subCov = covFIM([jParam iParam],[jParam iParam]);
                mu     = theta0([jParam iParam]);

                ssit.parest.ellipse(mu, chi2val * subCov, ellipseSpec, 'LineWidth', 2); hold on;
                plot(mu(1), mu(2), 'ks', 'MarkerSize', 8, 'MarkerFaceColor', 'w');

                xlabel(sprintf('%s', paramNames{jParam}), 'Interpreter', 'tex', ...
                       'FontSize', opts.AxisLabelSize);
                ylabel(sprintf('%s', paramNames{iParam}), 'Interpreter', 'tex', ...
                       'FontSize', opts.AxisLabelSize);
                set(gca, 'FontSize', opts.TickLabelSize);
                axis equal; grid on;
            end
        end
    end
end