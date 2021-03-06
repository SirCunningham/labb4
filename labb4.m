clear all
pos = load('Positions.txt');
t = pos(:, 1) * 0.001;
dt = filter([1 -1], 1, t);
T = length(t);
null = zeros(1, T);
xmin = null; xmax = null; ymin = null; ymax = null;
xmean = null; ymean = null; xstd = null; ystd = null; dist = null;
figure(1)
for(k=1:T)
    x = pos(k, 2:2:end);
    y = pos(k, 3:2:end);
    xmin(k) = min(x);
    xmax(k) = max(x);
    xmean(k) = mean(x);
    xstd(k) = std(x);
    ymin(k) = min(y);
    ymax(k) = max(y);
    ymean(k) = mean(y);
    ystd(k) = std(y);
    X = [x' y'];
    D = pdist2(X, X, 'euclidean', 'Smallest', 2);
    dist(k) = mean(D(2, :));

    set(gcf, 'DoubleBuffer', 'On')
    plot(x, y, '*')
    axis([min(xmin) max(xmax) min(ymin) max(ymax)])
    drawnow
    pause(dt(k) * 0.1)
end

figure(2)
hold on
plot(t, xmin, 'r:')
plot(t, ymin, 'b:')
plot(t, xmax, 'r--')
plot(t, ymax, 'b--')
title('Största resp. minsta x- och y-värde som funktion av t')
legend('x_{min}', 'y_{min}', 'x_{max}', 'y_{max}')

figure(3)
hold on
plot(t, xmean, 'r');
plot(t, ymean, 'b');
title('Medelvärde för x resp. y som funktion av t')
legend('x', 'y')

figure(4)
hold on
plot(t, xstd, 'r')
plot(t, ystd, 'b')
title('Standardavvikelse för x resp. y som funktion av t')
legend('x', 'y')

figure(5)
hold on
plot(t, dist, 'g')
title('Medelavstånd till närmaste partikel som funktion av t')
