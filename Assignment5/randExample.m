function randExample (HMMs)

%Input:
%HMMs that you can find using the TrainClassifiers function
%
%----------------------------------------------------
%Code Authors:
% Pierre Laurent
% Christopher Norman
%----------------------------------------------------
vectorSize = 10000;
characterToPot = 2;
A = [HMMs{1,:}];


for i=1:9
randVec{i} = rand(HMMs{characterToPot}, vectorSize);
end

 figure('Name','Plotting rand vectors obtained from source 2 ','NumberTitle','off')


for i = 1:9
    subplot(3,3,i)
    stem(logprob(A, randVec{i}))
    xlabel ('HMM index');
    ylabel ('logprob(X, HMM)');
end




end

