for mission in m1 m2 m3  # List of missions. mission contains the value from list
do
  echo $mission
done

#--------------------

for mission in {0..100} #Sequence expression
do
  echo mission-$mission
done

        #------OR-------

for ((mission = 0; mission <= 100; mission++ ))
do
  echo mission-$mission
done

