#! /bin/bash
read -ep "volume path: " volume
read -ep "main Command" mainCommand
read -ep "sub Command" subCommand
read -ep "run count" runCount
mkdir -v $volume$runCount 

echo "Run main container"
docker run --rm -t -v $volume${runCount}:$volume${runCount} fairness $mainCommand --output=${volume}${runCount}/Main${runCount} &
echo ${volume}${runCount}/Main${runCount}

echo "Run sub container "
sub=$(docker run --rm -v $volume${runCount}:$volume${runCount} -itd fairness) 
for (( i=1 ; i<=$runCount ; i++ ))
do
    docker exec -t $sub $subCommand --output=${volume}${runCount}/Sub${i} &
done

