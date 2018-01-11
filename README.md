### OpenShift Spice

Run your Linux GUI apps remotely in OpenShift using [Spice](https://www.spice-space.org)


#### Getting Started

Deploy the template

```
oc create -f
oc new-app --template spice-remoting-apps
```

Once the OpenShift BuildConfigs are complete run the following:

```
./client.sh
```


