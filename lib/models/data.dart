import 'models.dart';
import 'package:zohodesk_portal_community/zohodesk_portal_community.dart' show ZohodeskPortalCommunity;
import 'package:zohodesk_portal_submit_ticket/zohodesk_portal_submit_ticket.dart' show ZohodeskPortalSubmitTicket;
import 'package:zohodesk_portal_ticket/zohodesk_portal_ticket.dart' show ZohodeskPortalTicket;
import 'package:zohodesk_portal_kb/zohodesk_portal_kb.dart' show ZohodeskPortalKb;
import 'package:zohodesk_portal_gc/zohodesk_portal_gc.dart' show ZDPortalGC;
import 'package:zohodesk_portal_core/zohodesk_portal_core.dart' show ZohodeskPortalCore;
import 'package:zohodesk_portal_chat/zohodesk_portal_chat.dart' show ZDPortalChat;

final List<ModuleEntity> asapGuestUserModulesList = [
    ModuleEntity(
        name: "Home",
        desc: "ASAP Home Page contains all available ASAP Components",
        moduleInvoker: () {
            ZohodeskPortalCore.showHome();
        }
    ),
    ModuleEntity(
        name: "Knowledge Base",
        desc: "ASAP Knowledge Base, find articles",
        moduleInvoker: () {
            ZohodeskPortalKb.show();
        }
    ),
    ModuleEntity(
        name: "Community",
        desc: "ASAP Community, connect with people",
        moduleInvoker: () {
            ZohodeskPortalCommunity.show();
        }
    ),
    ModuleEntity(
        name: "Guided Conversation",
        desc: "Chat with GC Bot for more info",
        moduleInvoker: () {
            ZDPortalGC.show();
        }
    ),
    ModuleEntity(
        name: "Live Chat",
        desc: "Chat with agent for more info",
        moduleInvoker: () {
            ZDPortalChat.show();
        }
    ),
    ModuleEntity(
        name: "Submit Ticket",
        desc: "Don't find any solution, raise your ticket",
        moduleInvoker: () {
            ZohodeskPortalSubmitTicket.show();
        }
    )
];

final List<ModuleEntity> asapLoggedUserModules = [
    ModuleEntity(
        name: "My Tickets",
        desc: "Follow up with your ticket's status",
        moduleInvoker: () {
          ZohodeskPortalTicket.show();
        }
    ),
    ModuleEntity(
        name: "Add Forum",
        desc: "Post your thoughts as forums",
        moduleInvoker: () {
          ZohodeskPortalCommunity.showTopicForm();
        }
    )
];
