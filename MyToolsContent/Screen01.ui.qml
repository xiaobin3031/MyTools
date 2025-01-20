

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import MyTools
import QtQuickUltralite.Extras
import QtQuick.Timeline
import QtQuick.Timeline.BlendTrees

Rectangle {
    id: rectangle
    width: 1000
    height: 600

    color: Constants.backgroundColor

    Button {
        id: button
        text: qsTr("Press me")
        anchors.verticalCenter: parent.verticalCenter
        checkable: true
        anchors.horizontalCenter: parent.horizontalCenter

        Connections {
            target: button
            onClicked: animation.start()
        }
    }

    Text {
        id: label
        text: qsTr("Hello MyTools")
        anchors.top: button.bottom
        font.family: Constants.font.family
        anchors.topMargin: 45
        anchors.horizontalCenter: parent.horizontalCenter

        SequentialAnimation {
            id: animation

            ColorAnimation {
                id: colorAnimation1
                target: rectangle
                property: "color"
                to: "#2294c6"
                from: Constants.backgroundColor
            }

            ColorAnimation {
                id: colorAnimation2
                target: rectangle
                property: "color"
                to: Constants.backgroundColor
                from: "#2294c6"
            }
        }
    }

    Rectangle {
        id: siderbar
        x: 0
        width: 200
        color: "#ffffff"
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        rotation: 0

        Text {
            id: _text
            text: qsTr("My To Do")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 15
            anchors.topMargin: 0
            font.pixelSize: 12
        }

        Rectangle {
            id: user_rectangle
            height: 26
            color: "#ffffff"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: _text.bottom
            anchors.leftMargin: 5
            anchors.rightMargin: 5
            anchors.topMargin: 5

            Image {
                id: avatar
                width: 20
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 3
                anchors.topMargin: 3
                anchors.bottomMargin: 3
                source: "qrc:/qtquickplugin/images/template_image.png"
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: username
                y: 6
                text: qsTr("我是用户名")
                anchors.left: avatar.right
                anchors.right: tool.left
                anchors.leftMargin: 5
                anchors.rightMargin: 5
                font.pixelSize: 12
            }

            Image {
                id: tool
                x: 162
                width: 20
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 3
                anchors.topMargin: 3
                anchors.bottomMargin: 3
                source: "qrc:/qtquickplugin/images/template_image.png"
                fillMode: Image.PreserveAspectFit
            }
        }

        Rectangle {
            id: define_rectangle
            height: 69
            color: "#ffffff"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: user_rectangle.bottom
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            anchors.topMargin: 10
        }

        Rectangle {
            id: todo_list
            x: 200
            y: 200
            color: "#ffffff"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: define_rectangle.bottom
            anchors.bottom: siderbar_bottom.top
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            anchors.topMargin: 10
            anchors.bottomMargin: 5

            ListView {
                id: todo_list_views
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 5
                anchors.rightMargin: 5
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                highlightRangeMode: ListView.NoHighlightRange
                model: ListModel {}
                delegate: Row {
                    spacing: 5
                    Rectangle {
                        width: 100
                        height: 20
                        color: colorCode
                    }

                    Text {
                        width: 100
                        text: name
                    }
                }
            }
        }

        Rectangle {
            id: siderbar_bottom
            y: 447
            height: 26
            color: "#ffffff"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            anchors.bottomMargin: 0

            Image {
                id: add_btn
                width: 20
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 3
                anchors.topMargin: 3
                anchors.bottomMargin: 3
                source: "qrc:/qtquickplugin/images/template_image.png"
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: add_fold_btn
                x: 163
                width: 20
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 3
                anchors.topMargin: 3
                anchors.bottomMargin: 3
                source: "qrc:/qtquickplugin/images/template_image.png"
                fillMode: Image.PreserveAspectFit
            }

            TextInput {
                id: item_input
                y: 3
                height: 20
                text: qsTr("输入内容")
                anchors.left: add_btn.right
                anchors.right: add_fold_btn.left
                anchors.leftMargin: 5
                anchors.rightMargin: 10
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
            }
        }
    }

    Rectangle {
        id: content
        color: "#ffffff"
        anchors.left: siderbar.right
        anchors.right: content_detail.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 20
        anchors.rightMargin: 20
        anchors.topMargin: 15
        anchors.bottomMargin: 0

        Rectangle {
            id: content_toolbar
            height: 30
            color: "#ffffff"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            anchors.topMargin: 0
        }

        Rectangle {
            id: task_add_rectangle
            height: 26
            color: "#ffffff"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: content_toolbar.bottom
            anchors.leftMargin: 5
            anchors.rightMargin: 5
            anchors.topMargin: 5

            Image {
                id: task_add_btn
                width: 20
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 10
                anchors.topMargin: 3
                anchors.bottomMargin: 3
                source: "qrc:/qtquickplugin/images/template_image.png"
                fillMode: Image.PreserveAspectFit
            }

            TextInput {
                id: task_add_input
                text: qsTr("Text Input")
                anchors.left: task_add_btn.right
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 5
                anchors.rightMargin: 15
                anchors.topMargin: 3
                anchors.bottomMargin: 3
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
            }
        }

        Rectangle {
            id: task_list_rectangle
            color: "#ffffff"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: task_add_rectangle.bottom
            anchors.bottom: parent.bottom
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            anchors.topMargin: 5
            anchors.bottomMargin: 3

            ListView {
                id: task_list_view
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 0
                anchors.rightMargin: 0
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                model: ListModel {}
                delegate: Row {
                    spacing: 5
                    Rectangle {
                        width: 100
                        height: 20
                        color: colorCode
                    }

                    Text {
                        width: 100
                        text: name
                    }
                }
            }
        }
    }

    Rectangle {
        id: content_detail
        x: 917
        width: 300
        color: "#ffffff"
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.topMargin: 10
        anchors.bottomMargin: 0

        Rectangle {
            id: rectangle1
            height: 26
            color: "#ffffff"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            anchors.topMargin: 0

            Text {
                id: _text1
                text: qsTr("Text")
                anchors.left: parent.left
                anchors.right: content_detail_mark.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 10
                anchors.rightMargin: 5
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
            }

            Image {
                id: content_detail_mark
                x: 232
                width: 20
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 5
                anchors.topMargin: 3
                anchors.bottomMargin: 3
                source: "qrc:/qtquickplugin/images/template_image.png"
                fillMode: Image.PreserveAspectFit
            }
        }

        ListView {
            id: content_task_list_view
            height: 0
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: rectangle1.bottom
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            anchors.topMargin: 0
            model: ListModel {}
            delegate: Row {
                spacing: 5
                Rectangle {
                    width: 100
                    height: 20
                    color: colorCode
                }

                Text {
                    width: 100
                    text: name
                }
            }
        }
        Image {
            id: image
            width: 20
            height: 20
            anchors.left: parent.left
            anchors.top: content_task_list_view.bottom
            anchors.leftMargin: 10
            anchors.topMargin: 5
            source: "qrc:/qtquickplugin/images/template_image.png"
            fillMode: Image.PreserveAspectFit
        }

        TextInput {
            id: textInput
            y: 31
            height: 20
            text: qsTr("Text Input")
            anchors.left: image.right
            anchors.right: parent.right
            anchors.leftMargin: 10
            anchors.rightMargin: 10
            font.pixelSize: 12
        }

        Rectangle {
            id: rectangle2
            height: 200
            color: "#ffffff"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: image.bottom
            anchors.leftMargin: 10
            anchors.rightMargin: 10
            anchors.topMargin: 10
        }
    }
    states: [
        State {
            name: "clicked"
            when: button.checked

            PropertyChanges {
                target: label
                text: qsTr("Button Checked")
            }
        }
    ]
}
