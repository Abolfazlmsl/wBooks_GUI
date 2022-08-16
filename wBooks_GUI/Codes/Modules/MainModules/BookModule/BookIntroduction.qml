import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Styles 1.4

import "./../../../../Fonts/Icon.js" as Icons
import "./../../../../Functions/Funcs.js" as Functions

import "./../Ui_Module"

Rectangle {

    property alias relatedBooksModel:relatedBooks.itemModel
    property alias otherBooksModel:otherBooks.itemModel
    property alias offerBooksModel:offerBooks.itemModel
    property var commentModel: []
    property bool allComment: false


    color: "transparent"

//    width: parent.width
//    height: title1Rec.height + itemProps.height + 40 +
//            title2Rec.height + introItem.height + relatedBooksRec.height

    ColumnLayout{
        anchors.fill: parent

        Rectangle{
            id: title1Rec
            Layout.fillWidth: true
//            Layout.preferredHeight: parent.height * 0.025
            Layout.preferredHeight: txt1.contentHeight
            color: "transparent"
            Label{
                id: txt1
                anchors.fill: parent
                text: "مشخصات کتاب الکترونیک"
                font.family: mainFont.name
                font.bold: true
                color: color4
                verticalAlignment: Qt.AlignVCenter
                font.pixelSize: Qt.application.font.pixelSize * 1.7
            }
        }

        Item{
            id: itemProps
            Layout.fillWidth: true
//            Layout.preferredHeight: parent.height * 0.05
            Layout.preferredHeight: block.height
            RowLayout{
                anchors.fill: parent
                layoutDirection: Qt.RightToLeft

                BookPropsCol{
                    id: block
                    Layout.preferredWidth: parent.width /6
//                    Layout.fillHeight: true
                    text1: "تعداد صفحات"
                    text2: "224"
                    text3: "صفحه"
                }

                Rectangle{
                    Layout.preferredWidth: 2
                    Layout.fillHeight: true
                    color: "transparent"
                }

                BookPropsCol{
                    Layout.preferredWidth: parent.width /6
//                    Layout.fillHeight: true
                    text1: "قیمت نسخه چاپی"
                    text2: Functions.numberWithCommas("26000")
                    text3: "تومان"
                }
                Rectangle{
                    Layout.preferredWidth: 2
                    Layout.fillHeight: true
                    color: "transparent"
                }

                BookPropsCol{
                    Layout.preferredWidth: parent.width /6
//                    Layout.fillHeight: true
                    text1: "نوع فایل"
                    text2: "EPUB"
                }

                Rectangle{
                    Layout.preferredWidth: 2
                    Layout.fillHeight: true
                    color: "transparent"
                }

                BookPropsCol{
                    Layout.preferredWidth: parent.width /6
//                    Layout.fillHeight: true
                    text1: "تاریخ انتشار"
                    text2: "1398/06/25"
                }

                Rectangle{
                    Layout.preferredWidth: 2
                    Layout.fillHeight: true
                    color: "transparent"
                }

                BookPropsCol{
                    Layout.preferredWidth: parent.width /6
//                    Layout.fillHeight: true
                    text1: "شابک"
                    text2: "978-622-254-334-1"
                }
            }
        }

        Item{Layout.preferredHeight: 40}

        Rectangle{
            id: title2Rec
            Layout.fillWidth: true
//            Layout.preferredHeight: parent.height * 0.025
            Layout.preferredHeight: txt2.contentHeight
            color: "transparent"
            Label{
                id: txt2
                anchors.fill: parent
                text: "معرفی کتاب من پیش از تو"
                font.family: mainFont.name
                font.bold: true
                color: color4
                verticalAlignment: Qt.AlignVCenter
                font.pixelSize: Qt.application.font.pixelSize * 1.7
            }
        }

        Rectangle{
            id: introItem
            Layout.fillWidth: true
//            Layout.preferredHeight: parent.height * 0.05
            Layout.preferredHeight: txt3.contentHeight
            color: "transparent"

            Label{
                id: txt3
                anchors.fill: parent
                text: "این روزها به ندرت رمان عاشقانه‌ای خواهید یافت که درس زندگی دهد، یا اینکه قهرمانان کتاب در پایان با قلب مخاطب همراه شوند. اثر پرفروش من پیش از تو نوشته رمان‌نویس مشهور انگلیسی جوجو مویز از این دست کتاب‌ها است.

کتاب با لوئیزا کلارک که دختری جوان و 26 ساله است شروع می‌شود. او که جاه طلب و موفق نیست، مدام در داشتن شغلی پایدار و همیشگی شکست می‌خورد. لوئیزا با سمت پیشخدمت در کافه‌ای محلی مشغول به کار است و شغلش به عنوان کمک درآمدی برای خانواده‌ فقیرش است. در ادامه داستان، دیری نمی‌گذرد که کارش را از دست می‌دهد.

او که بسیار مأیوس شده، به سفارش دوست ورزشکارش «پاتریک» به مرکز کاریابی می‌رود. از آنجا او پیشنهاد مصاحبه برای سرپرستی فردی بالغ اما معلول را می‌پذیرد. او مرد جوانی به نام «ویل ترینر» می‌باشد که از طبقه بالای جامعه است. او روزگاری فردی بسیار پر جنب و جوش با آرزوهای بزرگ بود، ولی به علت تصادف با موتورسیکلت فلج شده و تمام وقت بر روی صندلی چرخ‌دار (ویلچر) نشسته و تمایل خود را برای زندگی از دست داده است. مادر ویل، کامیلا به خوبی می‌داند چگونه اوضاع را مدیریت کند تا روزی که او برای پایان دادن به نابسامانی‌های فرزندش، دختری شاد، سرزنده‌ و با احساس را که همان لوئیزا است را استخدام می‌کند.

نویسنده باهوش سرشارش در دام عاشقانه‌های کلاسیک گرفتار نشده و بیشتر به دنبال نمایش و تأکید بر ویژگی‌های مهم زندگی است. این کتاب به ما می‌آموزد که چگونه زندگی را به چالش بکشیم و کجا باید داستانی عاشقانه و شیرین را در پس‌زمینه‌ای از رویدادهای آموزنده زندگی، نه با صدایی بلند و نه خیلی محو شده در عشقی خوش‌بینانه را دید. اگر شما به دنبال رمانی واقع‌بینانه هستید و نمی خواهید تنها سرانجام عشق را ببینید، باید به دوردست‌ها خیره شوید، جایی که داستان لوئیزا و ویل می‌خواهد تصوری پایدار در ذهن خواننده ایجاد کند.

جوجو مویز، رمان من پیش از تو را بسیار روان نوشته است و با احساسات عمیق از سر آگاهی خواننده را متحول می‌کند. گفتگوها در کتاب خنده‌دار، جذاب و آزاد است. داستان دوستی بین لوئیزا کلارک و ویل ترینر از دل دعواها، ناسازگاری‌ها و سوء تفاهمات بیرون می‌آید.

شخصیت‌های کتاب، واقعی و صادقانه رفتار می‌کنند و با نقص‌های خود به خوبی روبرو شده و سعی در برطرف کردنشان هستند. رفتار لوئیزا کلارک واقع گرایانه است و رشد شخصیت او به اندازه کافی قانع کننده است تا خواننده بتواند به خاطر شیرین بودن، طبیعت احساسی و تعلق خاطرش برای مراقبت از ویل، با او همزادپنداری کند. از سوی دیگر، ویل ممکن است ناراحت کننده، خودمحور و در عین حال شخصیتی ناخوشایند به نظر رسد و مخاطب تنها برای او تأسف می‌خورد. اما با پیشرفت داستان، می‌توان تصویری پرجنب‌و‌جوش از مردی سرشار از زندگی و عشق را دید.





نویسنده تفسیر تازه‌ای از داستان‌های عاشقانه در سطوح رایجش را ارائه می‌دهد و از حساسیت‌های بی‌مورد بر مخاطب جلوگیری می‌کند. شخصیت‌ها فوراً در دام عشق نمی‌افتند، اما نخست دوستی و اعتماد را پرورش می‌دهند؛ زیرا آنها ناامیدی و سختی‌های زندگی را درک کرده‌اند. لوئیزا در بخشی از کتاب می‌گوید: «شما خوشحالی مرا می‌سازید، حتی زمانی که خیلی بداخلاق می‌شوید. من ترجیح می‌دهم با شما باشم، نسبت به هر کس دیگری در جهان.»

با خواندن کتاب، گاهی ممکن است از سر خنده، دیوانه‌وار شاد شوید و یا گاهی سیل‌آسا اشک ریزید. جادوی کلمات از سوی نویسنده نه تنها قدرتمند، بلکه زیبا هستند و می‌توانند خواننده را با عمیق‌ترین احساسات درونی‌اش مواجه کند. به طور کلی، کتاب بسیار غیر منتظره و با حالتی بسیار دلهره‌آور به پایانش نزدیک می‌شود. قسمت‌های نخستین تا میانه‌های رمان روایتی ساده و مستقیم دارد، اما در نهایت، شما به نقطه‌ای می‌رسید که نمی‌توانید کتاب را به کنار بگذارید."
                font.family: mainFaNumFont.name
                color: color4
                wrapMode: Text.WordWrap
            }
        }

        Rectangle{
            id: relatedBooksRec
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.12
//            Layout.preferredHeight: 60
            color: "transparent"
            SpecialOffer{
                id: relatedBooks
                anchors.fill: parent
                title: "کتاب های مرتبط"
                onMoreBtnClicked: {

                }
            }
        }

        Rectangle{
            id: title4Rec
            Layout.fillWidth: true
//            Layout.preferredHeight: parent.height * 0.025
            Layout.preferredHeight: txt4.contentHeight
            color: "transparent"
            Label{
                id: txt4
                anchors.fill: parent
                text: "نقد، بررسی و نظرات"
                font.family: mainFont.name
                font.bold: true
                color: color4
                verticalAlignment: Qt.AlignVCenter
                font.pixelSize: Qt.application.font.pixelSize * 1.7
            }
        }

        Rectangle{
            id: commentRec
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "transparent"
            ListView{
                id: commentView
                anchors.fill: parent
                spacing: 20
                clip: true
                model: (allComment)? commentModel.count:5
                delegate: Rectangle{
                    width: commentView.width
                    height: commenttxt.contentHeight + 90
                    color: color1

                    ColumnLayout{
                        anchors.fill: parent
                        spacing: 0
                        Item{
                            Layout.preferredHeight: parent.height * 0.3
                            Layout.fillWidth: true
                            RowLayout{
                                anchors.fill: parent
                                spacing: 5
                                layoutDirection: Qt.RightToLeft
                                Label{
                                    id: iconLabel
                                    Layout.preferredWidth: 20
                                    Layout.fillHeight: true

                                    Layout.rightMargin: 30

                                    text: (commentModel.get(index).profile === "")? Icons.account:model.profile
                                    color: color2
                                    font.family: webfont.name
                                    font.pixelSize: Qt.application.font.pixelSize * 3
                                    verticalAlignment: Qt.AlignVCenter
                                    horizontalAlignment: Qt.AlignHCenter
                                }

                                Label{
                                    id: nameLabel
                                    Layout.preferredWidth: 100
                                    Layout.fillHeight: true

                                    Layout.rightMargin: 15

                                    text: commentModel.get(index).name
                                    color: color2
                                    font.family: mainFont.name
                                    font.pixelSize: Qt.application.font.pixelSize * 1.5

                                    verticalAlignment: Qt.AlignVCenter
                                }

                                Label{
                                    id: dateLabel
                                    Layout.preferredWidth: 50
                                    Layout.fillHeight: true

                                    Layout.rightMargin: 30

                                    text: commentModel.get(index).date
                                    color: color15
                                    font.family: mainFaNumFont.name
                                    font.pixelSize: Qt.application.font.pixelSize * 1
                                    horizontalAlignment: Qt.AlignHCenter
                                    verticalAlignment: Qt.AlignVCenter
                                }

                                Item{Layout.fillWidth: true}

                                Rectangle{
                                    id: likeRec
                                    Layout.preferredWidth: 30
                                    Layout.preferredHeight: width
                                    radius: width / 2

                                    Layout.rightMargin: 15
                                    color: color14
                                    Label{
                                        id: likeLabel
                                        anchors.fill: parent
                                        text: Icons.thumb_up
                                        color: "#ffffff"
                                        font.family: webfont.name
                                        font.pixelSize: Qt.application.font.pixelSize * 1.5
                                        horizontalAlignment: Qt.AlignHCenter
                                        verticalAlignment: Qt.AlignVCenter
                                    }
                                    MouseArea{
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        onClicked: {

                                        }
                                    }
                                }

                                Label{
                                    id: likeNumber
                                    Layout.preferredWidth: 10
                                    Layout.fillHeight: true

                                    Layout.rightMargin: 5

                                    text: commentModel.get(index).like
                                    color: color4
                                    font.family: mainFaNumFont.name
                                    font.pixelSize: Qt.application.font.pixelSize * 1.5

                                    verticalAlignment: Qt.AlignVCenter
                                }

                                Label{
                                    id: dislikeNumber
                                    Layout.preferredWidth: 10
                                    Layout.fillHeight: true

                                    Layout.rightMargin: 15

                                    text: commentModel.get(index).dislike
                                    color: color4
                                    font.family: mainFaNumFont.name
                                    font.pixelSize: Qt.application.font.pixelSize * 1.5

                                    verticalAlignment: Qt.AlignVCenter
                                }

                                Rectangle{
                                    id: dislikeRec
                                    Layout.preferredWidth: 30
                                    Layout.preferredHeight: width
                                    radius: width / 2

                                    Layout.rightMargin: 5
                                    color: color2
                                    Label{
                                        id: dislikeLabel
                                        anchors.fill: parent
                                        text: Icons.thumb_down
                                        color: "#ffffff"
                                        font.family: webfont.name
                                        font.pixelSize: Qt.application.font.pixelSize * 1.5
                                        horizontalAlignment: Qt.AlignHCenter
                                        verticalAlignment: Qt.AlignVCenter
                                    }
                                    MouseArea{
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        onClicked: {

                                        }
                                    }
                                }

                                Item{Layout.preferredWidth: 20}
                            }
                        }

                        Rectangle{
                            Layout.preferredHeight: 1
                            Layout.fillWidth: true
                            Layout.rightMargin: 30
                            Layout.leftMargin: 20
                            color: color15
                        }

                        Rectangle{
                            id: commentItem
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.topMargin: 20
                            color: "transparent"
                            property bool fullText: false

                            Label{
                                id: commenttxt
                                anchors.fill: parent
                                anchors.rightMargin: 30
                                anchors.leftMargin: 50
                                text: (commentItem.fullText) ? commentModel.get(index).comment:
                                                               substring(commentModel.get(index).comment, 350) + "  " +
                                                               '<html><style type="text/css">
                                                                        a:link, a:visited {
                                                                          color: #3399ff;
                                                                        }
                                                                        a:hover {
                                                                          cursor:pointer;
                                                                         }
                                                                        </style><a href="بیشتر">بیشتر</a></html>'
                                font.family: mainFaNumFont.name
                                textFormat: Text.RichText
                                color: color4
                                wrapMode: Text.WordWrap
                                onLinkActivated: commentItem.fullText = true
                            }
                        }
                    }
                }
            }
        }

        Rectangle{
            id: allcommentItem
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.025
            Layout.topMargin: 20
            visible: (allComment) ? false:true
            color: "transparent"
            Item{
                anchors.fill: parent
                RowLayout{
                    anchors.fill: parent
                    spacing: 0
                    layoutDirection: Qt.RightToLeft
                    Item{Layout.fillWidth: true}

                    Label{
                        id: allcommenttxt
                        Layout.preferredWidth: 100
                        Layout.fillHeight: true
                        text: "مشاهده همه نظرات (" + (commentModel.count - 5) + ")"
                        font.family: mainFaNumFont.name
                        color: color5
                        verticalAlignment: Qt.AlignVCenter
                        horizontalAlignment: Qt.AlignHCenter
                        font.pixelSize: Qt.application.font.pixelSize * 1.7

                        MouseArea{
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: {
                                allComment = !allComment
                            }
                        }
                    }
                    Item{Layout.fillWidth: true}
                }

            }
        }

        Rectangle{
            id: otherBooksRec
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.12
            color: "transparent"
            SpecialOffer{
                id: otherBooks
                anchors.fill: parent
                title: "دیگر کتاب های این نشر"
                onMoreBtnClicked: {

                }
            }
        }


        Rectangle{
            id: offerBooksRec
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.12
            color: "transparent"
            SpecialOffer{
                id: offerBooks
                anchors.fill: parent
                title: "پیشنهاد وی بوکس"
                onMoreBtnClicked: {

                }
            }
        }
    }

    function substring(str, charNumbers) {
        return str.substring(0, charNumbers);
    }
}
