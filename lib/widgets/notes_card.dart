import 'package:BetterNotes/style/app_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppStyle.cardsColor[doc['color_id']],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  doc["note_title"],
                  style: AppStyle.mainTitle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: null,
                ),
              ),
              Container(
                width: 45,
                child: OutlinedButton(
                  onPressed: () async {
                    await doc.reference.delete();
                  },
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.transparent)),
                  child: const Icon(
                    Icons.dangerous_outlined,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            doc["note_content"],
            style: AppStyle.mainContent,
            overflow: TextOverflow.ellipsis,
            maxLines: null,
          ),
        ],
      ),
    ),
  );
}
