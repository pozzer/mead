/*
 Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.md or http://ckeditor.com/license
*/
!function(){function e(e,t,i){var o=n[this.id];if(o)for(var a=this instanceof CKEDITOR.ui.dialog.checkbox,r=0;r<o.length;r++){var s=o[r];switch(s.type){case 1:if(!e)continue;if(null!==e.getAttribute(s.name))return e=e.getAttribute(s.name),void this.setValue(a?"true"==e.toLowerCase():e);a&&this.setValue(!!s["default"]);break;case 2:if(!e)continue;if(s.name in i)return e=i[s.name],void this.setValue(a?"true"==e.toLowerCase():e);a&&this.setValue(!!s["default"]);break;case 4:if(!t)continue;if(t.getAttribute(s.name))return e=t.getAttribute(s.name),void this.setValue(a?"true"==e.toLowerCase():e);a&&this.setValue(!!s["default"])}}}function t(e,t,i){var o=n[this.id];if(o)for(var a=""===this.getValue(),r=this instanceof CKEDITOR.ui.dialog.checkbox,s=0;s<o.length;s++){var l=o[s];switch(l.type){case 1:if(!e||"data"==l.name&&t&&!e.hasAttribute("data"))continue;var c=this.getValue();a||r&&c===l["default"]?e.removeAttribute(l.name):e.setAttribute(l.name,c);break;case 2:if(!e)continue;if(c=this.getValue(),a||r&&c===l["default"])l.name in i&&i[l.name].remove();else if(l.name in i)i[l.name].setAttribute("value",c);else{var d=CKEDITOR.dom.element.createFromHtml("<cke:param></cke:param>",e.getDocument());d.setAttributes({name:l.name,value:c}),1>e.getChildCount()?d.appendTo(e):d.insertBefore(e.getFirst())}break;case 4:if(!t)continue;c=this.getValue(),a||r&&c===l["default"]?t.removeAttribute(l.name):t.setAttribute(l.name,c)}}}for(var n={id:[{type:1,name:"id"}],classid:[{type:1,name:"classid"}],codebase:[{type:1,name:"codebase"}],pluginspage:[{type:4,name:"pluginspage"}],src:[{type:2,name:"movie"},{type:4,name:"src"},{type:1,name:"data"}],name:[{type:4,name:"name"}],align:[{type:1,name:"align"}],"class":[{type:1,name:"class"},{type:4,name:"class"}],width:[{type:1,name:"width"},{type:4,name:"width"}],height:[{type:1,name:"height"},{type:4,name:"height"}],hSpace:[{type:1,name:"hSpace"},{type:4,name:"hSpace"}],vSpace:[{type:1,name:"vSpace"},{type:4,name:"vSpace"}],style:[{type:1,name:"style"},{type:4,name:"style"}],type:[{type:4,name:"type"}]},i="play loop menu quality scale salign wmode bgcolor base flashvars allowScriptAccess allowFullScreen".split(" "),o=0;o<i.length;o++)n[i[o]]=[{type:4,name:i[o]},{type:2,name:i[o]}];for(i=["play","loop","menu"],o=0;o<i.length;o++)n[i[o]][0]["default"]=n[i[o]][1]["default"]=!0;CKEDITOR.dialog.add("flash",function(n){var i,o=!n.config.flashEmbedTagOnly,a=n.config.flashAddEmbedTag||n.config.flashEmbedTagOnly,r="<div>"+CKEDITOR.tools.htmlEncode(n.lang.common.preview)+'<br><div id="cke_FlashPreviewLoader'+CKEDITOR.tools.getNextNumber()+'" style="display:none"><div class="loading">&nbsp;</div></div><div id="cke_FlashPreviewBox'+CKEDITOR.tools.getNextNumber()+'" class="FlashPreviewBox"></div></div>';return{title:n.lang.flash.title,minWidth:420,minHeight:310,onShow:function(){this.fakeImage=this.objectNode=this.embedNode=null,i=new CKEDITOR.dom.element("embed",n.document);var e=this.getSelectedElement();if(e&&e.data("cke-real-element-type")&&"flash"==e.data("cke-real-element-type")){this.fakeImage=e;var t=n.restoreRealElement(e),o=null,a=null,r={};if("cke:object"==t.getName()){o=t,t=o.getElementsByTag("embed","cke"),0<t.count()&&(a=t.getItem(0));for(var t=o.getElementsByTag("param","cke"),s=0,l=t.count();l>s;s++){var c=t.getItem(s),d=c.getAttribute("name"),c=c.getAttribute("value");r[d]=c}}else"cke:embed"==t.getName()&&(a=t);this.objectNode=o,this.embedNode=a,this.setupContent(o,a,r,e)}},onOk:function(){var e=null,t=null,i=null;if(this.fakeImage?(e=this.objectNode,t=this.embedNode):(o&&(e=CKEDITOR.dom.element.createFromHtml("<cke:object></cke:object>",n.document),e.setAttributes({classid:"clsid:d27cdb6e-ae6d-11cf-96b8-444553540000",codebase:"http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0"})),a&&(t=CKEDITOR.dom.element.createFromHtml("<cke:embed></cke:embed>",n.document),t.setAttributes({type:"application/x-shockwave-flash",pluginspage:"http://www.macromedia.com/go/getflashplayer"}),e&&t.appendTo(e))),e)for(var i={},r=e.getElementsByTag("param","cke"),s=0,l=r.count();l>s;s++)i[r.getItem(s).getAttribute("name")]=r.getItem(s);r={},s={},this.commitContent(e,t,i,r,s),e=n.createFakeElement(e||t,"cke_flash","flash",!0),e.setAttributes(s),e.setStyles(r),this.fakeImage?(e.replace(this.fakeImage),n.getSelection().selectElement(e)):n.insertElement(e)},onHide:function(){this.preview&&this.preview.setHtml("")},contents:[{id:"info",label:n.lang.common.generalTab,accessKey:"I",elements:[{type:"vbox",padding:0,children:[{type:"hbox",widths:["280px","110px"],align:"right",children:[{id:"src",type:"text",label:n.lang.common.url,required:!0,validate:CKEDITOR.dialog.validate.notEmpty(n.lang.flash.validateSrc),setup:e,commit:t,onLoad:function(){var e=this.getDialog(),t=function(t){i.setAttribute("src",t),e.preview.setHtml('<embed height="100%" width="100%" src="'+CKEDITOR.tools.htmlEncode(i.getAttribute("src"))+'" type="application/x-shockwave-flash"></embed>')};e.preview=e.getContentElement("info","preview").getElement().getChild(3),this.on("change",function(e){e.data&&e.data.value&&t(e.data.value)}),this.getInputElement().on("change",function(){t(this.getValue())},this)}},{type:"button",id:"browse",filebrowser:"info:src",hidden:!0,style:"display:inline-block;margin-top:14px;",label:n.lang.common.browseServer}]}]},{type:"hbox",widths:["25%","25%","25%","25%","25%"],children:[{type:"text",id:"width",requiredContent:"embed[width]",style:"width:95px",label:n.lang.common.width,validate:CKEDITOR.dialog.validate.htmlLength(n.lang.common.invalidHtmlLength.replace("%1",n.lang.common.width)),setup:e,commit:t},{type:"text",id:"height",requiredContent:"embed[height]",style:"width:95px",label:n.lang.common.height,validate:CKEDITOR.dialog.validate.htmlLength(n.lang.common.invalidHtmlLength.replace("%1",n.lang.common.height)),setup:e,commit:t},{type:"text",id:"hSpace",requiredContent:"embed[hspace]",style:"width:95px",label:n.lang.flash.hSpace,validate:CKEDITOR.dialog.validate.integer(n.lang.flash.validateHSpace),setup:e,commit:t},{type:"text",id:"vSpace",requiredContent:"embed[vspace]",style:"width:95px",label:n.lang.flash.vSpace,validate:CKEDITOR.dialog.validate.integer(n.lang.flash.validateVSpace),setup:e,commit:t}]},{type:"vbox",children:[{type:"html",id:"preview",style:"width:95%;",html:r}]}]},{id:"Upload",hidden:!0,filebrowser:"uploadButton",label:n.lang.common.upload,elements:[{type:"file",id:"upload",label:n.lang.common.upload,size:38},{type:"fileButton",id:"uploadButton",label:n.lang.common.uploadSubmit,filebrowser:"info:src","for":["Upload","upload"]}]},{id:"properties",label:n.lang.flash.propertiesTab,elements:[{type:"hbox",widths:["50%","50%"],children:[{id:"scale",type:"select",requiredContent:"embed[scale]",label:n.lang.flash.scale,"default":"",style:"width : 100%;",items:[[n.lang.common.notSet,""],[n.lang.flash.scaleAll,"showall"],[n.lang.flash.scaleNoBorder,"noborder"],[n.lang.flash.scaleFit,"exactfit"]],setup:e,commit:t},{id:"allowScriptAccess",type:"select",requiredContent:"embed[allowscriptaccess]",label:n.lang.flash.access,"default":"",style:"width : 100%;",items:[[n.lang.common.notSet,""],[n.lang.flash.accessAlways,"always"],[n.lang.flash.accessSameDomain,"samedomain"],[n.lang.flash.accessNever,"never"]],setup:e,commit:t}]},{type:"hbox",widths:["50%","50%"],children:[{id:"wmode",type:"select",requiredContent:"embed[wmode]",label:n.lang.flash.windowMode,"default":"",style:"width : 100%;",items:[[n.lang.common.notSet,""],[n.lang.flash.windowModeWindow,"window"],[n.lang.flash.windowModeOpaque,"opaque"],[n.lang.flash.windowModeTransparent,"transparent"]],setup:e,commit:t},{id:"quality",type:"select",requiredContent:"embed[quality]",label:n.lang.flash.quality,"default":"high",style:"width : 100%;",items:[[n.lang.common.notSet,""],[n.lang.flash.qualityBest,"best"],[n.lang.flash.qualityHigh,"high"],[n.lang.flash.qualityAutoHigh,"autohigh"],[n.lang.flash.qualityMedium,"medium"],[n.lang.flash.qualityAutoLow,"autolow"],[n.lang.flash.qualityLow,"low"]],setup:e,commit:t}]},{type:"hbox",widths:["50%","50%"],children:[{id:"align",type:"select",requiredContent:"object[align]",label:n.lang.common.align,"default":"",style:"width : 100%;",items:[[n.lang.common.notSet,""],[n.lang.common.alignLeft,"left"],[n.lang.flash.alignAbsBottom,"absBottom"],[n.lang.flash.alignAbsMiddle,"absMiddle"],[n.lang.flash.alignBaseline,"baseline"],[n.lang.common.alignBottom,"bottom"],[n.lang.common.alignMiddle,"middle"],[n.lang.common.alignRight,"right"],[n.lang.flash.alignTextTop,"textTop"],[n.lang.common.alignTop,"top"]],setup:e,commit:function(e,n,i,o,a){var r=this.getValue();t.apply(this,arguments),r&&(a.align=r)}},{type:"html",html:"<div></div>"}]},{type:"fieldset",label:CKEDITOR.tools.htmlEncode(n.lang.flash.flashvars),children:[{type:"vbox",padding:0,children:[{type:"checkbox",id:"menu",label:n.lang.flash.chkMenu,"default":!0,setup:e,commit:t},{type:"checkbox",id:"play",label:n.lang.flash.chkPlay,"default":!0,setup:e,commit:t},{type:"checkbox",id:"loop",label:n.lang.flash.chkLoop,"default":!0,setup:e,commit:t},{type:"checkbox",id:"allowFullScreen",label:n.lang.flash.chkFull,"default":!0,setup:e,commit:t}]}]}]},{id:"advanced",label:n.lang.common.advancedTab,elements:[{type:"hbox",children:[{type:"text",id:"id",requiredContent:"object[id]",label:n.lang.common.id,setup:e,commit:t}]},{type:"hbox",widths:["45%","55%"],children:[{type:"text",id:"bgcolor",requiredContent:"embed[bgcolor]",label:n.lang.flash.bgcolor,setup:e,commit:t},{type:"text",id:"class",requiredContent:"embed(cke-xyz)",label:n.lang.common.cssClass,setup:e,commit:t}]},{type:"text",id:"style",requiredContent:"embed{cke-xyz}",validate:CKEDITOR.dialog.validate.inlineStyle(n.lang.common.invalidInlineStyle),label:n.lang.common.cssStyle,setup:e,commit:t}]}]}})}();