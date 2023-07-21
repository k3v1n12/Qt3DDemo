/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/

import QtQuick 6.5
import QtQuick.Controls 6.5
import QtQuick3D 6.5
import Qt3DDemo
import Quick3DAssets.Scene
import QtQuick.Timeline 1.0

Rectangle {
    width: Constants.width
    height: Constants.height

    color: Constants.backgroundColor

    View3D {
        id: view3D
        anchors.fill: parent

        environment: sceneEnvironment

        SceneEnvironment {
            id: sceneEnvironment
            antialiasingMode: SceneEnvironment.MSAA
            antialiasingQuality: SceneEnvironment.High
        }

        Node {
            id: scene
            DirectionalLight {
                id: directionalLight
                x: -391.793
                y: 134.465
                scale.z: 0.375
                scale.y: 0.375
                scale.x: 0.375
                castsShadow: true
                brightness: 5.49
                eulerRotation.z: 62.65553
                eulerRotation.y: -43.68352
                eulerRotation.x: 5.20862
                z: 749.1521
            }

            PerspectiveCamera {
                id: sceneCamera
                x: 0
                y: 50
                z: 200
            }

            Scene {
                id: robot
                eulerRotation.y: robotSlider.value
            }

            Model {
                id: cube
                x: 246.415
                y: 52.522
                source: "#Cube"
                receivesShadows: true
                castsShadows: false
                scale.z: 1.79335
                scale.y: 1.10341
                scale.x: 1.72227
                materials: defaultMaterial
                z: -78.9791
            }
        }

        Slider {
            id: robotSlider
            y: 466
            opacity: 0
            anchors.fill: parent
            to: 180
            from: -180
            value: 0
        }
    }

    Item {
        id: __materialLibrary__
        DefaultMaterial {
            id: defaultMaterial
            objectName: "Default Material"
            diffuseColor: "#4aee45"
        }
    }

    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                loops: 1
                running: true
                duration: 1000
                to: 1000
                from: 0
            }
        ]
        endFrame: 1000
        startFrame: 0
        enabled: true

        KeyframeGroup {
            target: sceneCamera
            property: "z"
            Keyframe {
                frame: 799
                value: 350
            }
        }
    }
}
