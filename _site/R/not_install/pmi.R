library(text2vec)
wiki <- readr::read_lines("~/Downloads/datasets/text8.zip")
tokens <- strsplit(wiki, split = " ", fixed = T)
it = itoken(tokens)
min_term_count = 50
max_phrase_len = 2
stopwords = character(0)
k = 2
detect_phrases = function(it, min_term_count = 50, max_phrase_len = 2, stopwords = character(0)) {
  vocab_1 <- create_vocabulary(it) %>%
    prune_vocabulary(term_count_min = min_term_count)
  total = sum(vocab_1$vocab$terms_counts)

  for (k in 2:max_phrase_len) {
    vocab <- create_vocabulary(it, ngram = c(1,k)) %>%
      prune_vocabulary(term_count_min = min_term_count)

    vectorizer = vocab_vectorizer(vocab, skip_grams_window = 1, grow_dtm = F)
    tcm = create_tcm(it, vectorizer)
    dt = data.frame(pmi = vocab$vocab$terms_counts)[, ii := 0L:(.N - 1)]
    setDT(dt)
  }
}
Sys.time()

Sys.time()
Sys.time()
v$vocab[, ngram_n :=  terms %>% strsplit('_', T) %>% vapply(length, 0L)]

# library(text2vec)
# Sys.time()
# vocab <- create_vocabulary(itoken(tokens), ngram = c(1,2), stopwords = tokenizers::stopwords()) %>%
#   prune_vocabulary(term_count_min = 50)
# vocab[]
#
#
tcm = create_tcm(itoken(tokens), vectorizer = vocab_vectorizer(vocab, skip_grams_window = 1, grow_dtm = F))
# Sys.time()
# total = sum(vocab$vocab$terms_counts)
# dt2 = data.table(pmi = vocab$vocab$terms_counts)[, ii := 0L:(.N - 1)]
# setkey(dt2, ii)
#
# dt = data.frame(i = tcm@i, j = tcm@j, x = tcm@x)
# setDT(dt)
# dt3 = dt2[dt2[dt, .(pmi_ij = x, pmi_i = pmi, i, j), on = c('ii'='i')], .(pmi_ij, pmi_i, pmi_j = pmi, i, j ), on = c('ii'='j')]
#
# for (k in 1:100)
#   print(vocab$vocab$terms[dt3[pmi_ij > 1000 & pmi > 3 & pmi_i > 300 & pmi_j > 300][order(-pmi)][k, .(i + 1, j + 1)] %>% unlist])
#
