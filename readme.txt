雲端伺服器的web.config需增加一條指令
<system.web>
    <authentication mode="None" />
    <customErrors mode="Off"/>     /This command
    <compilation targetFramework="4.5.2" />
    <httpRuntime targetFramework="4.5.2" />
</system.web>