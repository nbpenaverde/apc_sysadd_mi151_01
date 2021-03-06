<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\WebvisitHistory;

/**
 * WebvisitHistorySearch represents the model behind the search form about `app\models\WebvisitHistory`.
 */
class WebvisitHistorySearch extends WebvisitHistory
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id'], 'integer'],
            [['wvh_date', 'wvh_ip_address', 'wvh_url', 'wvh_cookie_information',
             'customer_id'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = WebvisitHistory::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }
        $query->joinWith('customer');
        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'wvh_date' => $this->wvh_date,
            //'wvh_time' => $this->wvh_time,
           // 'customer_id' => $this->customer_id,
        ]);

        $query->andFilterWhere(['like', 'wvh_ip_address', $this->wvh_ip_address])
            ->andFilterWhere(['like', 'wvh_url', $this->wvh_url])
            ->andFilterWhere(['like', 'wvh_cookie_information', $this->wvh_cookie_information])
            ->andFilterWhere(['like', 'customer_fname', $this->customer_id])
            ->andFilterWhere(['like', 'customer_lname', $this->customer_id]);

        return $dataProvider;
    }
}
