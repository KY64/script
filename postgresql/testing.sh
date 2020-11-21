#!/bin/sh

echo
echo "CUBE 128";
echo "Finding 10 nearest from 1K rows"
time psql -p 4999 -U postgres -d postgres -c "select value from vec128x1krows order by value <-> cube(array[0.5,0.5,0.5]) limit 10;" | tail -n 2;
echo
echo "Finding 10 nearest from 5K rows"
time psql -p 4999 -U postgres -d postgres -c "select value from vec128x5krows order by value <-> cube(array[0.5,0.5,0.5]) limit 10;" | tail -n 2;
echo
echo "Finding 10 nearest from 10K rows"
time psql -p 4999 -U postgres -d postgres -c "select value from vec128x10krows order by value <-> cube(array[0.5,0.5,0.5]) limit 10;" | tail -n 2;
echo
echo "Finding 10 nearest from 25K rows"
time psql -p 4999 -U postgres -d postgres -c "select value from vec128x25krows order by value <-> cube(array[0.5,0.5,0.5]) limit 10;" | tail -n 2;
echo
echo "Finding 10 nearest from 50K rows"
time psql -p 4999 -U postgres -d postgres -c "select value from vec128x50krows order by value <-> cube(array[0.5,0.5,0.5]) limit 10;" | tail -n 2;
echo
echo "Finding 10 nearest from 100K rows"
time psql -p 4999 -U postgres -d postgres -c "select value from vec128x100krows order by value <-> cube(array[0.5,0.5,0.5]) limit 10;" | tail -n 2;
echo
echo "Finding 10 nearest from 500K rows"
time psql -p 4999 -U postgres -d postgres -c "select value from vec128x500krows order by value <-> cube(array[0.5,0.5,0.5]) limit 10;" | tail -n 2;
echo
echo "Finding 10 nearest from 1000K rows"
time psql -p 4999 -U postgres -d postgres -c "select value from vec128x1000krows order by value <-> cube(array[0.5,0.5,0.5]) limit 10;" | tail -n 2;

echo
echo "CUBE 256";
echo "Finding 10 nearest from 1K rows"
time psql -p 4999 -U postgres -d postgres -c "select value from vec256x1krows order by value <-> cube(array[0.5,0.5,0.5]) limit 10;" | tail -n 2;
echo
echo "Finding 10 nearest from 5K rows"
time psql -p 4999 -U postgres -d postgres -c "select value from vec256x5krows order by value <-> cube(array[0.5,0.5,0.5]) limit 10;" | tail -n 2;
echo
echo "Finding 10 nearest from 10K rows"
time psql -p 4999 -U postgres -d postgres -c "select value from vec256x10krows order by value <-> cube(array[0.5,0.5,0.5]) limit 10;" | tail -n 2;
echo
echo "Finding 10 nearest from 25K rows"
time psql -p 4999 -U postgres -d postgres -c "select value from vec256x25krows order by value <-> cube(array[0.5,0.5,0.5]) limit 10;" | tail -n 2;
echo
echo "Finding 10 nearest from 50K rows"
time psql -p 4999 -U postgres -d postgres -c "select value from vec256x50krows order by value <-> cube(array[0.5,0.5,0.5]) limit 10;" | tail -n 2;
echo
echo "Finding 10 nearest from 100K rows"
time psql -p 4999 -U postgres -d postgres -c "select value from vec256x100krows order by value <-> cube(array[0.5,0.5,0.5]) limit 10;" | tail -n 2;
echo
echo "Finding 10 nearest from 500K rows"
time psql -p 4999 -U postgres -d postgres -c "select value from vec256x500krows order by value <-> cube(array[0.5,0.5,0.5]) limit 10;" | tail -n 2;
echo
echo "Finding 10 nearest from 1000K rows"
time psql -p 4999 -U postgres -d postgres -c "select value from vec256x1000krows order by value <-> cube(array[0.5,0.5,0.5]) limit 10;" | tail -n 2;

echo
echo "CUBE 512";
echo "Finding 10 nearest from 1K rows"
time psql -p 4999 -U postgres -d postgres -c "select value from vec512x1krows order by value <-> cube(array[0.5,0.5,0.5]) limit 10;" | tail -n 2;
echo
echo "Finding 10 nearest from 5K rows"
time psql -p 4999 -U postgres -d postgres -c "select value from vec512x5krows order by value <-> cube(array[0.5,0.5,0.5]) limit 10;" | tail -n 2;
echo
echo "Finding 10 nearest from 10K rows"
time psql -p 4999 -U postgres -d postgres -c "select value from vec512x10krows order by value <-> cube(array[0.5,0.5,0.5]) limit 10;" | tail -n 2;
echo
echo "Finding 10 nearest from 25K rows"
time psql -p 4999 -U postgres -d postgres -c "select value from vec512x25krows order by value <-> cube(array[0.5,0.5,0.5]) limit 10;" | tail -n 2;
echo
echo "Finding 10 nearest from 50K rows"
time psql -p 4999 -U postgres -d postgres -c "select value from vec512x50krows order by value <-> cube(array[0.5,0.5,0.5]) limit 10;" | tail -n 2;
echo
echo "Finding 10 nearest from 100K rows"
time psql -p 4999 -U postgres -d postgres -c "select value from vec512x100krows order by value <-> cube(array[0.5,0.5,0.5]) limit 10;" | tail -n 2;
echo
echo "Finding 10 nearest from 500K rows"
time psql -p 4999 -U postgres -d postgres -c "select value from vec512x500krows order by value <-> cube(array[0.5,0.5,0.5]) limit 10;" | tail -n 2;
echo
echo "Finding 10 nearest from 1000K rows"
time psql -p 4999 -U postgres -d postgres -c "select value from vec512x1000krows order by value <-> cube(array[0.5,0.5,0.5]) limit 10;" | tail -n 2;
