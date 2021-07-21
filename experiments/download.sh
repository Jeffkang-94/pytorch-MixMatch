
# CIFAR10
for VAR in 1sJaSoNvqiaczxB9e-x5QqJ0Hy0gM_jO3 1y-PkCmIpyXsZpMxCawrYhXxhppf919Jh 1uxyVTT0Dyj6AmmN6Od2SPaQ915q9LYFJ 14lERKZdQbNV4mxN4QUXrepPjjBoGruYF 1HGQWdnh8fLkwBXhAWBLg3PXHdF54_9Vw
do
    curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=$VAR" > /dev/null
    curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=$VAR" -o "$VAR.pth"
done

mkdir results
label_list=(250 500 1000 2000 4000)
file_list=(1sJaSoNvqiaczxB9e-x5QqJ0Hy0gM_jO3 1y-PkCmIpyXsZpMxCawrYhXxhppf919Jh 1uxyVTT0Dyj6AmmN6Od2SPaQ915q9LYFJ 14lERKZdQbNV4mxN4QUXrepPjjBoGruYF 1HGQWdnh8fLkwBXhAWBLg3PXHdF54_9Vw)
for index in {0..4}
do
    filepath="results/Mixmatch_${label_list[index]}/CIFAR10_28-2_${label_list[index]}"
    mkdir -p $filepath
    #mv ${file_list[index]}.pth Mixmatch_${label_list[index]}.pth
    mv ${file_list[index]}.pth best.pth
    mv best.pth $filepath
done
rm cookie