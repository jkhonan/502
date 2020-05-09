#!/bin/bash

./lda.py --arg '../data/tucson_rain.txt' --m_start 2 --m_limit 40 --m_step 5 --model_list_indx 4 --num_words 5

mkdir tucson_results
mv coherence_values.png documents_per_topic.tsv dominant_topics.tsv model_topics.txt sent_topics_sorted_df_mallet.tsv topic_numbers_and_coherence_values.txt tucson_results

./lda.py --arg '../data/flagstaff_rain.txt' --m_start 2 --m_limit 40 --m_step 5 --model_list_indx 4 --num_words 5

mkdir flagstaff_results
mv coherence_values.png documents_per_topic.tsv dominant_topics.tsv model_topics.txt sent_topics_sorted_df_mallet.tsv topic_numbers_and_coherence_values.txt flagstaff_results
