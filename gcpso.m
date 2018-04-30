%%initial parameter???
ft = 1;                                 %range control ????
success = 15;                           %numbers of success????
failure = 5;                            %numbers of failure????
suNumber = 0;                           %count the number of success??????
faNumber = 0;                           %count the number of failure??????
speedKeep = zeros(1,dimensions);        %keep the speed of best particle

%%first insert
suNumber = suNumber + 1;
faNumber = 0;
else 
    faNumber = faNumber + 1;
    suNumber = 0;
%%second insert
speedKeep = speed(nMax,:);
%%third insert
if suNumber > success
    ft = 2 * ft;
    failure = failure + 1; %renew failure??????
elseif faNumber > failure
    ft = 0.5 * ft;
    success = success + 1; %renew success?????? 
end
x(Nmax,:) = yBest(:) + w * speedKeep + ft .* (1 - 2 * rand(1,dimensions)); 