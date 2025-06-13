
                MERGE (c:City {
                    name: 'Київ',
                    latitude: 50.4501,
                    longitude: 30.5234,
                    population: 2967000,
                    is_region_center: true
                })
                RETURN c
            

                MERGE (c:City {
                    name: 'Харків',
                    latitude: 49.9935,
                    longitude: 36.2304,
                    population: 1441000,
                    is_region_center: true
                })
                RETURN c
            

                MERGE (c:City {
                    name: 'Одеса',
                    latitude: 46.4825,
                    longitude: 30.7233,
                    population: 1017000,
                    is_region_center: true
                })
                RETURN c
            

                MERGE (c:City {
                    name: 'Дніпро',
                    latitude: 48.4647,
                    longitude: 35.0462,
                    population: 990000,
                    is_region_center: true
                })
                RETURN c
            

                MERGE (c:City {
                    name: 'Донецьк',
                    latitude: 48.0159,
                    longitude: 37.8028,
                    population: 905000,
                    is_region_center: true
                })
                RETURN c
            
