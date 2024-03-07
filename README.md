# Infinimesh Timeseries App

The Infinimesh Timeseries app offers visualization and monitoring your data remotely anytime and anywhere. With the advance technology stack that been used, now your data are able to visualize in various devices and platforms such as Android, IPhone, tablet,IPad, computer even in web. The app also has been integrate seamlessly with Grafana by just input the credentials and now you able to access all Grafana feature in your phone too.

Infinimesh Timeseries App Features:

- Credential page to input API token and endpoint
- Grafana Login Page
- Panels dashboard
- Zooming Chart Panel with Hero transition
- Able to highlight your chart
- Seamlessly Grafana integration

# Version Update

Check it out at [version release]().

# Technology Stack

![Flutter SDK](https://img.shields.io/badge/Flutter-3.16.8-blue) ![Dart](https://img.shields.io/badge/Dart-3.2.5-orange) ![OS](https://img.shields.io/badge/OS-Android-yellow)

# Screenshots

# Table of Content

- [Setup](#setup)
  - [Get Repo](#get-repo)
- [How To](#how-to)
  - [Generate Grafana API Key](#generate-grafana-api-key)

# Setup

## Get Repo

1. Clone project

```
git clone <project url>
```

2. Update packages

```
flutter pub get
```

3. Build ios configuration

```
flutter build ios
```

4. Run App on simulator

   <kbd>fn</kbd> + <kbd>f5</kbd>

   or

```
flutter run
```

# How To

This section will guide you step by step on how to setup related topics below.

## Generate Grafana API Key

1. Open your Grafana Platform.
   ![Gen API Key 1](https://github.com/infinimesh/infinimesh-timeseries-app/assets/80098610/4fea2ceb-d569-43e1-8e98-b03a567d6f53)

2. Look for the menu icon at top left corner.
   ![Gen API Key 2](https://github.com/infinimesh/infinimesh-timeseries-app/assets/80098610/9f93c420-fbdd-495c-8ae7-8e8dd4d5ef03)

3. Open it and look out for `Administration` tab.
   ![Gen API Key 3](https://github.com/infinimesh/infinimesh-timeseries-app/assets/80098610/7073cd4e-92d3-491d-ae5a-80ba978ba624)

4. At `Administration` page look for `Users and Access`.
   ![Gen API Key 4](https://github.com/infinimesh/infinimesh-timeseries-app/assets/80098610/ba792de9-0a23-434c-b239-8a06e0daf4b1)

5. At `Users and Access` page look for `Service Accounts`.
   ![Gen API Key 5](https://github.com/infinimesh/infinimesh-timeseries-app/assets/80098610/12ef4b74-15ad-43d7-ab03-4aace68e9d31)

6. At `Service Accounts` page look for `Add Service Account` button and press it.
   ![Gen API Key 6](https://github.com/infinimesh/infinimesh-timeseries-app/assets/80098610/06fc9782-1310-4dfc-ae68-75c49bc3f628)

7. Input any display name and put `admin` as your role.
   ![Gen API Key 7](https://github.com/infinimesh/infinimesh-timeseries-app/assets/80098610/aa5a1fca-1c8c-4aaf-a060-4dfaec38f3ba)

8. Once the account had been created, your interface should look like this :
   ![Gen API Key 8](https://github.com/infinimesh/infinimesh-timeseries-app/assets/80098610/fc99bf49-0cde-44d2-899c-b38027ebca90)

9. Look for `add service account token` button and press it to start generate the token.
   ![Gen API Key 9](https://github.com/infinimesh/infinimesh-timeseries-app/assets/80098610/301f1a66-297a-47f3-8153-50522e5c78c1)

10. You'll be prompt to generate the token, input any display name and press `generate token` button.
    ![Gen API Key 10](https://github.com/infinimesh/infinimesh-timeseries-app/assets/80098610/20eb5f1e-9ef7-42c9-9554-937af90b03c6)

11. Once the token has been generated, copy to clipboard and close the prompter.
    ![Gen API Key 11](https://github.com/infinimesh/infinimesh-timeseries-app/assets/80098610/4373d0fa-6978-4df1-bd78-5e9513ecfa70)

12. Done you succeed to generate the service account token and can be use for the API with that token key.
