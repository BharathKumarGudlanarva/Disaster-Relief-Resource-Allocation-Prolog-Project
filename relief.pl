% Disaster Relief Resource Alloction Expert System

%Facts: Resources available
resource(food).
resource(water).
resource(shelter).
resource(medical).
resource(volunteers).

% Disaster scenarios
disaster(flood).
disaster(earthquake).
disaster(cyclone).
disaster(pandemic).

% Rules for priority allocation based on disaster type
priority(flood, [water, shelter, food, medical, voluteers]).
priority(earthquake, [medical, food, water, medical, voluteers]).
priority(cyclone, [shelter, shelter, food, medical, voluteers]).
priority(pandemic, [medical, food, water, shelter, voluteers]).

% Rule to suggest allocation
allocate(Disaster, Plan):- disaster(Disaster), priority(Disaster, Plan).

% Rule to explain why a resource is needed
reason(water, flood, 'Water is essential as floods contaminate drinking water.').
reason(medical, earthquake, 'Medical help is urgent due to injuries').
reason(shelter, cyclone, 'Strong winds damage houses, so shelter is top priority.').
reason(medical, pandemic, 'Medical aid is the first line of defense in pandemics.').
reason(_, _, 'Resource allocation is based on survival priorities').

suggest(Disaster) :- allocate(Disaster, Plan), write('For '), write(Disaster), write(', allocate resources in order: '), write(Plan), nl.
