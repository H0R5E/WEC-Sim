%Plot heave response for body 1
output.plotResponse(1,3);

power = -output.bodies.velocity(:,3).*output.ptos.forceTotal(:,3);
Etot = trapz(output.bodies.time,power);
% %Plot heave forces for body 1
% output.plotForces(1,3);