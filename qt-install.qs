function Controller() {

    installer.installationFinished.connect(function() {
            gui.clickButton(buttons.NextButton);
    });
    installer.setMessageBoxAutomaticAnswer("OverwriteTargetDirectory", QMessageBox.Yes);
    installer.setMessageBoxAutomaticAnswer("installationErrorWithRetry", QMessageBox.Ignore);
}

Controller.prototype.WelcomePageCallback = function() {
    gui.clickButton(buttons.NextButton,1000);
}

Controller.prototype.CredentialsPageCallback = function() {
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.IntroductionPageCallback = function() {
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.TargetDirectoryPageCallback = function()
{
    gui.currentPageWidget().TargetDirectoryLineEdit.setText("/opt/Qt");
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.ComponentSelectionPageCallback = function() {
    var widget = gui.currentPageWidget();

    widget.selectAll();
    
    widget.deselectComponent("qt.qt5.5121.gcc_64");
    widget.deselectComponent("qt.qt5.5121.android_x86");
    widget.deselectComponent("qt.qt5.5121.android_arm64_v8a");
    widget.deselectComponent("qt.qt5.5121.src");
    widget.deselectComponent("qt.qt5.5121.qtcharts");
    widget.deselectComponent("qt.qt5.5121.qtdatavis3d");
    widget.deselectComponent("qt.qt5.5121.qtpurchasing");
    widget.deselectComponent("qt.qt5.5121.qtvirtualkeyboard");
    widget.deselectComponent("qt.qt5.5121.qtwebengine");
    widget.deselectComponent("qt.qt5.5121.qtnetworkauth");
    widget.deselectComponent("qt.qt5.5121.qtwebglplugin");
    widget.deselectComponent("qt.qt5.5121.qtscript");
    widget.deselectComponent("qt.qt5.5121.doc");
    widget.deselectComponent("qt.qt5.5121.examples");
    widget.deselectComponent("qt.tools.qtcreator");

    gui.clickButton(buttons.NextButton);
}

Controller.prototype.LicenseAgreementPageCallback = function() {
    gui.currentPageWidget().AcceptLicenseRadioButton.setChecked(true);
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.StartMenuDirectoryPageCallback = function() {
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.ReadyForInstallationPageCallback = function()
{
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.FinishedPageCallback = function() {
    var checkBoxForm = gui.currentPageWidget().LaunchQtCreatorCheckBoxForm
    if (checkBoxForm && checkBoxForm.launchQtCreatorCheckBox) {
        checkBoxForm.launchQtCreatorCheckBox.checked = false;
    }
    gui.clickButton(buttons.FinishButton);
}
