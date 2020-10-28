kubectl create configmap <CONFIGMAP_NAME>  --from-file=<FOLDER_WITH_THE_FILES>
kubectl create configmap jmeter-run-movies --from-file=prerun.sh -n harbur -o yaml

