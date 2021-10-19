tic
marc=213;
ManE=22e6;
mu=176;
sigma=10;
H=sigma*randn(1,ManE)+mu;
ngasoles=sum(H>=marc);
pG=ngasoles/ManE*100;
fprintf("PGasol: %0.2f\n", pG);
toc