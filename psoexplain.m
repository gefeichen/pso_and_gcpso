inputData = rand(100,100,100)*20-10;

%%initial parameter
w = 0.8;                                        %inertia factor????
c1 = 2;                                         %self-learning factor??????
c2 = 3;                                         %group learning factor??????
particles = 20;                                 %number of particle????
iterations = 100;                               %number of iteration????
dimensions = 3;                                 %dimension??
nMax = randperm(particles,1);                   %index of best particle ??????

speedLimition = [-5,5];                         %speed parameter limition??????
siteLimition = [1,100;1,100;1,100];             %positional parameter limition??????

%-------------------------%
%initial particles speed and position   ???????????
speed = round(rand(particles,dimensions) * 10);
x = floor(rand(particles,dimensions) * 99) + 1;          
%initial data storage      ???????
xBest = x;                                       %each particle's best position  ????????
yBest = zeros(1,dimensions);                     %best position for each particles in history  ????????
xFit = zeros(particles,1);                       %each particle's best fittness  ???????????
yFit = -inf;                                     %best fittness in history ?????????


%%iteration begin ????
for iIteration = 1:iterations
    for iParticles = 1:particles
        xFitness = inputData(x(iParticles,1),x(iParticles,2),x(iParticles,3));  
                                                 %current particle fittness???????
        if xFitness > xFit(iParticles)           %renew particle's best position??????
            xFit(iParticles) = xFitness;
            xBest(iParticles,:) = x(iParticles,:);
        end
    end
    
    if yFit < max(xFit)                          %renew best fittness??????
        [yFit,nMax] = max(xFit);
        Ybest = xBest(nMax,:);
        %%first insert?????
    end
%%iteration end,renew speed and position????????????

%second insert

speed = floor(speed * w + c1 * rand * (xBest - x) + c2 * rand * (repmat(yBest,particles,1) - x));%renew speed????
%boundary speed process??????
speed(speed < speedLimition(2)) = speedLimition(2);
speed(speed > speedLimition(1)) = speedLimition(1);
x = x + speed;%renew position ????
%third insert 

%boundary position process??????
x(x(:,1) < siteLimition(1,1)) = siteLimition(1,1);
x(x(:,1) > siteLimition(1,2)) = siteLimition(1,2);
x(x(:,2) < siteLimition(2,1)) = siteLimition(2,1);
x(x(:,2) > siteLimition(2,2)) = siteLimition(2,2);
x(x(:,3) < siteLimition(3,1)) = siteLimition(3,1);
x(x(:,3) > siteLimition(3,2)) = siteLimition(3,2);
end

bestvalue = yFit;









