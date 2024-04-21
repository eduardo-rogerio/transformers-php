<?php

declare(strict_types=1);

use function Codewithkyrian\Transformers\Pipelines\pipeline;

require 'bootstrap.php';

$pipe = pipeline('sentiment-analysis');

$out = $pipe('I love transformers!');

var_dump($out);
