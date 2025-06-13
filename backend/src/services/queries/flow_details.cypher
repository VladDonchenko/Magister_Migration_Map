MATCH (c1:City {name: $fromCity}), (c2:City {name: $toCity})
MATCH (p:Person)-[r1:MIGRATED]->(c1), (p)-[r2:MIGRATED_TO]->(c2)
WITH p, c1, c2
WITH p, 
    CASE 
        WHEN p.gender = 'Чоловіча' THEN 'male'
        WHEN p.gender = 'Жіноча' THEN 'female'
        ELSE 'unknown'
    END as gender,
    p.age as age,
    p.reason as reason,
    p.transport as transport,
    p.housing as housing
WITH collect({
    name: p.name,
    gender: gender,
    age: age,
    reason: reason,
    transport: transport,
    housing: housing
}) as people,
count(p) as total,
avg(p.age) as avgAge,
collect(DISTINCT p.gender) as genders,
collect(DISTINCT p.reason) as reasons,
collect(DISTINCT p.transport) as transports,
collect(DISTINCT p.housing) as housings
WITH people, total, avgAge, genders, reasons, transports, housings
MATCH (c1:City {name: $fromCity}), (c2:City {name: $toCity})
MATCH (p:Person)-[r1:MIGRATED]->(c1), (p)-[r2:MIGRATED_TO]->(c2)
WITH p.gender as gender, people, total, avgAge, reasons, transports, housings
WITH gender, count(*) as count, people, total, avgAge, reasons, transports, housings
WITH collect({gender: gender, count: count}) as genderDist,
    people, total, avgAge, reasons, transports, housings
MATCH (c1:City {name: $fromCity}), (c2:City {name: $toCity})
MATCH (p:Person)-[r1:MIGRATED]->(c1), (p)-[r2:MIGRATED_TO]->(c2)
WITH p.reason as reason, genderDist, people, total, avgAge, transports, housings
WITH reason, count(*) as count, genderDist, people, total, avgAge, transports, housings
WITH collect({reason: reason, count: count}) as reasonDist,
    genderDist, people, total, avgAge, transports, housings
MATCH (c1:City {name: $fromCity}), (c2:City {name: $toCity})
MATCH (p:Person)-[r1:MIGRATED]->(c1), (p)-[r2:MIGRATED_TO]->(c2)
WITH p.transport as transport, reasonDist, genderDist, people, total, avgAge, housings
WITH transport, count(*) as count, reasonDist, genderDist, people, total, avgAge, housings
WITH collect({type: transport, count: count}) as transportDist,
    reasonDist, genderDist, people, total, avgAge, housings
MATCH (c1:City {name: $fromCity}), (c2:City {name: $toCity})
MATCH (p:Person)-[r1:MIGRATED]->(c1), (p)-[r2:MIGRATED_TO]->(c2)
WITH p.housing as housing, transportDist, reasonDist, genderDist, people, total, avgAge
WITH housing, count(*) as count, transportDist, reasonDist, genderDist, people, total, avgAge
WITH collect({type: housing, count: count}) as housingDist,
    transportDist, reasonDist, genderDist, people, total, avgAge
RETURN {
    totalCount: total,
    averageAge: avgAge,
    genderDistribution: genderDist,
    reasonDistribution: reasonDist,
    transportDistribution: transportDist,
    housingDistribution: housingDist,
    people: people
} as flowDetails 