import 'models.dart';
import 'package:zohodesk_portal_community/zohodesk_portal_community.dart' show ZohodeskPortalCommunity;
import 'package:zohodesk_portal_submit_ticket/zohodesk_portal_submit_ticket.dart' show ZohodeskPortalSubmitTicket;
import 'package:zohodesk_portal_ticket/zohodesk_portal_ticket.dart' show ZohodeskPortalTicket;
import 'package:zohodesk_portal_kb/zohodesk_portal_kb.dart' show ZohodeskPortalKb;
import 'package:zohodesk_portal_chatkit/zohodesk_portal_chatkit.dart'
    show ZohodeskPortalChatKit;
import 'package:zohodesk_portal_core/zohodesk_portal_core.dart' show ZohodeskPortalCore;
import 'package:zohodesk_portal_siq/zohodesk_portal_siq.dart' show ZohodeskPortalSiq;

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
          ZohodeskPortalChatKit.showGC();
        }
    ),
    ModuleEntity(
        name: "SalesIQ Chat",
        desc: "Chat with agent for more info",
        moduleInvoker: () {
          ZohodeskPortalSiq.show();
        }
    ),
    ModuleEntity(
        name: "Submit Ticket",
        desc: "Don't find any solution, raise your ticket",
        moduleInvoker: () {
            ZohodeskPortalSubmitTicket.show();
        }
    ),
    ModuleEntity(
        name: "Answer Bot",
        desc: "Ask the bot your queries",
        moduleInvoker: () {
          ZohodeskPortalChatKit.showAnswerBot();
        }
    ),
    ModuleEntity(
        name: "Business Messaging",
        desc: "Chat with agent directly",
        moduleInvoker: () {
          ZohodeskPortalChatKit.showBM();
        }
    ),
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
