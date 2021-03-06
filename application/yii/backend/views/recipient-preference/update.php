<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\RecipientPreference */

$this->title = 'Update Recipient Preference: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Recipient Preferences', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="recipient-preference-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
