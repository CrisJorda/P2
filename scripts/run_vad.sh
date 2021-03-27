#!/bin/bash

# Be sure that this file has execution permissions:
# Use the nautilus explorer or chmod +x run_vad.sh

# Write here the name and path of your program and database
DB=~/PAV/P2/db.v4
CMD=bin/vad

touch results.txt
rm results.txt
touch temp.txt

for alfa0 in $(seq 0 1 5); do
    for alfa1 in $(seq 0 0.01 0.05); do
        for alfa2 in $(seq 0 100 1000); do
            for filewav in $DB/*/*wav; do
            #    echo
                echo "**************** $filewav ****************"
                if [[ ! -f $filewav ]]; then 
                    echo "Wav file not found: $filewav" >&2
                    exit 1
                fi

                filevad=${filewav/.wav/.vad}
                $CMD -i $filewav -o $filevad -0 alfa0 -1 alfa1 -2 alfa2|| exit 1

            # Alternatively, uncomment to create output wave files
            #    filewavOut=${filewav/.wav/.vad.wav}
            #    $CMD $filewav $filevad $filewavOut || exit 1

            done

            scripts/vad_evaluation.pl $DB/*/*lab > ~/PAV/P2/temp.txt
            echo "$alfa0 $alfa1 $alfa2" >> results.txt
            tail -2 temp.txt >> results.txt
        done
    done
done

rm temp.txt
exit 0